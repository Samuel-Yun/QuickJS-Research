# 归档来源与许可

- `sources/base.tar.gz`：官方bellard/quickjs，精确commit见README和manifest；MIT许可，完整LICENSE在归档内。
- `sources/ng_parent.tar.gz`、`ng_removed.tar.gz`：官方quickjs-ng/quickjs精确历史commit，MIT许可及完整版权声明在各归档LICENSE内。移植必须保留LICENSE.NG；未打包整个bare历史库。
- `legacy_attempt01/*.json.gz`与CSV归档：本项目独立诊断所生成的数据，压缩前后SHA256和原始字节数见`archives.json`。不是QuickJS引擎源码或第三方实验结果。
- 仓库顶层未提供明确的数据再分发许可，本轮不替作者新增许可；诊断数据的明确再授权条款记UNKNOWN。归档供本项目复核，不代表已对外发布或授予新的权利。
- Octane工作负载继续使用冻结官方文件，其版权/许可在`benchmarks/octane/upstream/LICENSE`，本目录不改写许可。生成的诊断/计时脚本不改变工作负载的归属。

恢复：`python recover.py verify`，然后 `python recover.py restore --destination <全新目录>`。
也可 `gzip -dc <归档.json.gz> > <新文件.json>`，再与archives.json中的original_sha256核对。
派生CSV可以通过`python recover.py old-diagnostics`重建为压缩文件；不使用汇总表反造原始事件。
