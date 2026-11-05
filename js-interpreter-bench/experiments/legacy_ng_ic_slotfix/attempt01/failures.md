# 本轮保留的失败与恢复

- WSL递归`git status --short`触发子仓库扫描，耗时过长后停止，`raw/build/repository.1.json`退出-15；其空输出不能当作成功。开始的Windows原生Git检查确认HEAD=fbc008a、工作区干净；最终原生非递归检查另有日志。
- C/正式构建与所有运行正确性、1440正式样本、32全量诊断、144内存检查没有失败或重试；校准/pilot和正式分开。无性能异常值删除。
- 交付检查第一次用Windows默认GBK读取UTF-8脚本触发UnicodeDecodeError，尚未执行该次重算。已把新工具相关读取显式设为UTF-8，不改JS/VM/实验数据。
- Windows重建派生CSV时，gzip压缩字节与Linux版本不同导致一次断言失败，见`raw/build/portable_recover.py_old-diagnostics.1.*`。已改为先核对解压后CSV的精确原始SHA，再复用已有归档；不覆写原gzip。新检查通过。原始归档自身仍按archives.json的压缩与解压SHA双重校验，不放宽它。
- 一次只读WSL补充检查的自动权限审核超时，未执行命令；改在原生Windows执行数据工具，并完成实际Windows统计/诊断重算及显式路径映射身份检查。后续Linux最终身份/报告审计也通过。
- 所有恢复只涉及新目录的工具/派生展示，冻结manifest/protocol/schedule、正式runner/common、引擎源码与raw均未改写。没有将重算或内存检查并入正式样本。
