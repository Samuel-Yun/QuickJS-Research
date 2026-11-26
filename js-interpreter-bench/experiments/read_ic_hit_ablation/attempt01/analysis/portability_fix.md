# 收尾时保留的跨平台失败说明

正式实验、独立诊断与四次统计重放均已通过后，在Windows再次执行`archives.py verify`时，
28个归档的压缩/原文SHA核验通过，但写入既有`analysis/archives.json`触发append-only冲突。
原因是原实现对Path排序：Windows按不区分大小写的路径顺序，而Linux按区分大小写的顺序，
导致`gate_*`与大写workload文件的清单顺序不同；并非归档数值或哈希不一致。

只把新attempt工具的遍历排序改为显式文件名字符串排序，使Linux/Windows顺序一致。
原归档、metadata及Linux生成的archives.json均未改写；修后Windows重新核验28个归档成功，
仍逐一验证压缩SHA、解压原文SHA和字节数，没有通过忽略内容差异让检查通过。
本项属于归档验证工具可移植性修复，发生于采样结束后，不改变冻结runner、引擎或正式数据。
