# 本 attempt 的离线元数据修正

正式运行入口加载后，发现新summary模板把正确性条数误写为48；实际四组×N(1/2/64)×两引擎=24。
该修改只影响汇总字段，不改变case、driver、N、时钟、顺序、样本或统计。
第一次runner audit保留于diagnostics/runner_audit_before_count_correction.json；
随后用修正的入口离线summarize重建audit.json，已有CSV字节相同，所有raw/formal原样保留。
manifest的entry_script_sha256是运行开始时版本；独立审计另记录最终脚本hash，不将二者混称。
QuickJS独立PC采样库编译出现一条if排版警告，原stderr保留；未重编或替换正式qjs，采样结果不作性能样本。
