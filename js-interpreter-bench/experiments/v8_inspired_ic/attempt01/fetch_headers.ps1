# Alternative OS trust store, same fixed official URL, normal TLS verification.
# The WSL certificate-chain failure remains in source_manifest.json.
$ErrorActionPreference = 'Stop'
$attemptRoot = $PSScriptRoot
$records = @()
foreach ($relativePath in @('src/ic/ic.h','src/ic/stub-cache.cc','src/objects/data-handler-inl.h')) {
    $url = 'https://raw.githubusercontent.com/v8/v8/37fb84941c9be9f9914ee50b1ad366f06a1bd764/' + $relativePath
    $target = Join-Path $attemptRoot ('source_reference/v8/' + $relativePath)
    if (Test-Path -LiteralPath $target) { throw "Refuse overwrite: $target" }
    $record = [ordered]@{ url=$url; upstream_path=$relativePath; TLS_verification=$true; method='Windows Invoke-WebRequest default trust store; alternative to WSL trust failure'; status='UNKNOWN'; sha256=$null }
    try {
        $null = New-Item -ItemType Directory -Path (Split-Path $target) -Force
        Invoke-WebRequest -Uri $url -OutFile $target -UseBasicParsing -TimeoutSec 40
        $record.status='FETCHED_OFFICIAL_FIXED_COMMIT'
        $record.sha256=(Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash.ToLowerInvariant()
        $record.size_bytes=(Get-Item -LiteralPath $target).Length
    } catch { $record.status='MISSING_ALTERNATIVE_TRUST_FETCH_FAILED'; $record.error=$_.Exception.Message }
    $records += [pscustomobject]$record
}
$output = Join-Path $attemptRoot 'source_headers_supplement.json'
if (Test-Path -LiteralPath $output) { throw 'Refuse overwrite supplement' }
$records | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $output -Encoding UTF8
$records | Format-Table upstream_path,status,sha256
