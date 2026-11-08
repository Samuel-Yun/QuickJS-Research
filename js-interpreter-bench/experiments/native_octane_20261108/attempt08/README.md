# 首次调用准备与同偏移双shape缓存

用户希望继续超过现有最佳整体结果。本批分别基于冻结READ_STORE验证ENTRY1和OWN2，不叠加失败的S002扫描。每个候选完整17项Octane、每项5个新进程，共170条新性能样本。A/PREP2/READ_STORE及独立S002仅复用历史本机数据，不跑SunSpider/V8_OFF。

ENTRY1：普通同步函数在第一次真实调用、栈溢出检查之后、取得入口PC和建立活动frame之前准备IC；未执行函数保持普通字节码。使用已有read_ic_ready，不增加计数器或函数头，不像旧L1等待第三次调用并扫描活动栈。generator/async保持编译/加载时准备，避免移动挂起PC。准备的可选分配失败保留普通图像、保留异常状态、不再重试；内部probe验证该路径。准备开始即置ready，分配中的同步重入可执行旧普通图像并在分配返回前完成。

OWN2：普通get_field的记录原本不使用holder_shape作为原型守卫。将该现有强引用用于第二种own shape，仅当两种布局的目标字段下标相同。不同下标时退回原单态更新并释放旧边；get_field2继续原P1语义。B2借用前缀也接受第二shape。共享写入的准备操作数用目标地址低位区分来源是普通read还是keep-receiver read，运行和写出序列化时对齐恢复；原型holder不冒充第二own shape。原mark/free已遍历两条边，记录仍24B、函数头仍144B。可能增加间接shape/prototype保活，固定记录大小不等于总内存不增。

安全检查覆盖普通语义、删除/descriptor/Proxy、递归共享代码、generator/async、P1/B2/shared-store、C API保存加载/GC/native finalizer、ASan/UBSan以及两个专门的内部机制probe。ENTRY1额外测试第一次调用与可选OOM；OWN2额外测试两个shape稳定命中、不同下标回退、两类shared-write来源和热保存加载。LSan依既有环境限制关闭，不宣称完整test262或完整OOM覆盖。

编译为本机GCC15.2/-O2/-g/-fwrapv/HAVE_CLOSEFROM，不新增NDEBUG/LTO/PGO/march=native。CPU2、输入/N、首次Run边界沿用冻结Ubuntu协议。构建/安全检查/性能串行，两个候选按case交错和轮换顺序，各用一个固定ELF运行全部17项。没有按benchmark名称选择实现。

入口`python3 -u -B run.py all`，冻结后不修改生成器、候选源码、probe、runner或输入，不覆盖失败token。独立离线统计审计为`python3 -B review.py`，不执行引擎。实际状态以audit.json为准，结果见results.md及各CSV。相对旧对照为跨批次探索，bootstrap不包括未观测环境漂移，不能仅凭五轮小幅点估计确认稳定超过父版。

已完成170条性能样本、34条负载正确性及专项/ASan/UBSan/probe/审计/独立统计复算。ENTRY1/OWN2核心相对READ_STORE为+0.63%/+0.61%，均未晋级。ENTRY1两个CodeLoad下降5.73%/4.14%，保留为局部信号；后续只对冷调用入口作独立修订。性能后的独立N=1计数在post_counts，不计入性能分数。见[summary.md](summary.md)。
