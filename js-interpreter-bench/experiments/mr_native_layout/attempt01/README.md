# M/R固定native链接布局实验

只测M4.numeric_control、M1.own_integer、M3.own_method、Richards.Richards。没有新IC策略，没有A/P/ON，也没有全Octane排名。
来源为myx/e9a71a01722a34bb9e61314965020d56d93141f9；冻结设计见[design.md](design.md)。
已完成704/704有效正式记录：基线192、布局512；独立审计PASS。两次标准库便携重放各11个输出PASS，原raw/发布统计hash不变。结论见[results.md](results.md)，完整表见[analysis/tables.md](analysis/tables.md)。

## 看哪些材料

- [manifest.final.json](manifest.final.json)：唯一正式制品清单。manifest.json/manifest.initial.json是首版padding元数据不完整的制品，不能拿来运行正式样本。
- [sources/identities.json](sources/identities.json)、patches/：原M/R精确源码身份与历史补丁；正式引擎源码未改变。
- [layout/addresses.csv](layout/addresses.csv)：请求值到实际函数位置；[零条件失败及修正](engineering_notes.md)全部保留。
- [diagnostic/gate.json](diagnostic/gate.json)、diagnostic/raw/：采样前N1/N2 correctness-driver分派/生命周期。计时driver的独立补充在diagnostic/measurement_driver/，不得混进正式时间。
- [native/target_bytecode.md](native/target_bytecode.md)、[native_notes.md](native_notes.md)：真实规范码及逐操作候选native执行说明。
- [native/opcode_entries.csv](native/opcode_entries.csv)、native/final/：真实ELF入口/完整反汇编/DWARF、独立加载映射。
- [layout/relocation_comparison.csv](layout/relocation_comparison.csv)：按原重定位字段而非删数字文本比对的结果。
- raw/base_pre、raw/layout、raw/base_post：三个独立采样阶段。raw/pilot不是正式样本。
- analysis/：绝对时间、mean/样本std/Tukey Q1/Q3/IQR/min/max、探索区间、图和审计；不混cohort、不做GM、不选最佳padding。

## 一、已有公开raw重算（不需要WSL、ELF或旧/home目录）

在本目录，用Python3标准库：

```text
python analyze.py --output 一个尚不存在的输出目录
python replay.py
python replay.py
```

replay每次建立新目录，从raw重算全部统计/区间图，与发布统计按rel/abs=1e-12比较，核对原raw/发布输出hash不变。
analyze不加载ELF、不验证Linux宿主、不读缓存CSV代替raw。完整记录必须同时在raw/base_pre、raw/layout、raw/base_post，缺失就报错，不能从summary反造。
`python explain.py`和`python link_check.py`只用公开诊断/ASM/map重建材料；native.py本身需要实际Linux ELF，不属于portable statistics。
压缩诊断/ASM用gzip，双SHA见delivery_archives.json（收尾生成）；解压示例 `gzip -dc input.txt.gz > output.txt`，以original_sha256核对。

## 二、从固定源码恢复、重新编译/重链接（必须新attempt、新store）

不需要bare Git历史，也不能把ELF或整对象目录提交Git。所需公开材料：

- experiments/read_ic_hit_ablation/attempt01/recovery/baseline_M.tar.gz与baseline_M.json；
- experiments/read_ic_dequickening/attempt01的源码身份、M_to_R.patch、correctness、micros.py和冻结workload；
- benchmarks/octane/upstream/base.js、richards.js。

源码归档含原MIT许可证，Octane沿用原文件许可证。原字节hash与LF规范化不是同一身份；本轮不改旧哈希，逐文件检查原M/R字节。

先在仓库内运行：

```text
python3 reproduce.py ../attempt02
cd ../attempt02
export MR_LAYOUT_STORE=/tmp/mr_native_layout_attempt02
python3 prepare.py restore
python3 prepare.py build
python3 repair_padding.py
python3 diagnostics.py build
python3 diagnostics.py collect
python3 native.py
python3 run.py correctness
python3 explain.py
python3 link_check.py
```

`MR_LAYOUT_STORE`必须是不存在的新路径。build只对每版干净编译一次；repair_padding只汇编固定padding、重链接同一原对象，保留首版与最终制品，不重编译quickjs.c。
实际正式程序都在store/final/{M_base,R_base,M_p000,...}/qjs，10个条件路径等长。编译路径会进入debug信息，新建campaign不承诺ELF bit-identical或合并历史时间。
如果工具版本/host改变，新的manifest如实记录；GCC非13.3.0会阻止本协议直接执行，不能偷偷更换工具链。

## 三、新采集（不是重放旧数据）

```text
python3 campaign.py
python3 audit.py
python3 diagnostic_measure.py
python3 padding_check.py
python3 analyze.py
python3 postcheck.py
python3 replay.py
python3 replay.py
```

campaign顺序为freeze→三次pilot/条件→原基线前段96→布局512→后段96。固定seed20261024，超时300s，N上限131072；正式上限704。
每样本首次Run在内部区间、无计时前workload预跑；GC/helper/builtin仍计入。基线bootstrap按前后段分层pair；布局按完整8条件block，共享10000组索引。
已有记录只resume，不重抽失败/异常值/偏短位置。若发生时钟异常，保留BLOCKED_TIMER并停止，不修raw或补到目标数。
工具/采样失败应报告部分结果；不追加padding值、第二套布局方法、阈值或flags，不自动commit/push。
