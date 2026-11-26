**A / EVAL_COLD / V8_ON：原生30轮确认**

用户指定仅跑这三个版本，Octane和SunSpider每项各30个独立新进程。固定目标3870条新性能样本：Octane 17项×3版×30=1530，SunSpider 26项×3版×30=2340。旧五轮数据不进入分母或统计，不测其他版本。

使用本机已经冻结和验证的A、EVAL_COLD Release ELF及官方V8 15.6.21 ELF，逐字节SHA复核；不改引擎源码、不重建变体。原A和EVAL_COLD源码、源manifest、原资格检查引用及系统动态库SHA另存。QJS仍为GCC15.2/-O2/-g/-fwrapv/HAVE_CLOSEFROM，无LTO/PGO/NDEBUG/march=native。V8_ON固定--jitless --no-lazy --use-ic，并显式指定原snapshot_blob。

保持原冻结负载、进程内既定N与原Setup/Run边界。每个新进程内计时包含第一次Run，不做workload预热；以原生单调时钟计时，排除加载/Setup。SunSpider使用原26项wrapper、checksum表达式与允许值，不新增误差容忍。UTC/C locale和CPU2亲和在全部三版一致设置；不改系统governor、频率或其它系统参数。

30轮均随机打散43个case块，每块三版紧邻串行运行，六种版本顺序各出现五次。一个独立进程是一条样本，进程内N次调用不视为独立样本。先做所有case/版的N1/N2正确性，共258条，全部通过才进入正式采样。

正式前冻结run.py、analyze.py、audit.py、输入/脚本/顺序/运行时/source文件SHA以及30轮停止规则；不按显著性追加轮数。所有有效慢点及低于1000ms的样本保留并标记，不事后重校准N。不自动重试失败token，不丢弃未配对process_start；若发生进程/正确性/身份错误，保存failure和原始归档后停止。普通工具中断后仅可保留已完成token继续未执行项，不改冻结文件或覆盖失败记录。

逐项以30进程中位数比较。Octane按原14个suite分层等权几何平均；SunSpider报告26项等权GM，并补充逐项中位数总和。10000次成对整轮bootstrap在所有case和三版使用相同round索引，固定seed，报告95%百分位区间；单项多重比较未经校正。正式30轮不能消除未观测系统干扰，也不代表全部程序或API兼容性。

运行`python3 -u -B run.py all`，结束后依次`python3 -B analyze.py`和`python3 -B audit.py`。全部实时日志在runs.jsonl（本地忽略），正式压缩原始记录在raw；progress.json为进度快照。报告以audit.json及results.md实际完成状态为准。此次源码未变，复用原EVAL_COLD专项/native/ASan/UBSan证据，不重跑sanitizer，也没有完整test262。

实际状态：date-format-tofte/A/N1因时区校验失败停止，正式性能0条；原因及替代批次见summary.md。
