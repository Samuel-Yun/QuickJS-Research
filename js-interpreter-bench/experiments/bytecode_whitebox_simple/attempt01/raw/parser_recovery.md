2026-10-15: first dump extraction stopped after successfully capturing arithmetic's
complete QuickJS output. The extractor expected a C-style function declaration,
but this revision prints `filename:line:column: function: name`. Corrected only
the offline header parser; retained the original raw capture. No target JS,
expected result, runtime, flags or performance sample changed. The manifest's
entry_script_sha256 is the initial runner; audit.json records its final hash.
