# 开发失败与材料边界

- 初次Windows bootstrap沿用默认编码，读中文脚本遇GBK UnicodeDecodeError；改成显式UTF-8后重跑。
  文件复用改为先核对已存在文件，不覆盖用户数据。尚未生成正式样本。
- 初次bridge计数脚本的注释锚点在QuickJS出现两次，断言拒绝；改为唯一OPCODE_ASM_LABEL锚点。
  失败目录保留在独立Linux store，新诊断构建使用新后缀。
- bridge计数构建发现QuickJS禁用malloc宏、JSOpCode正式结构不带name字段；改用诊断专用calloc及同一opcode定义生成名称表。
  编译失败原始日志保留于raw/build/M_bridge_counter_build.1.*，成功后才产生桥接计数/性能样本。
- R只实现一个预声明布局/快路径和K32，没有因pilot/正式方向改变引擎逻辑、输入或病例集合。
- `ownership.md`区分实际私有C atom refcount检查与全suite可推导的所有权路径，不把未逐次记录的全atom池变化冒称实测。
- bridge opcode计数是实测computed-goto分派，不是所有handler融合消耗的逻辑opcode，也不是CPU指令计数；仅使用固定无动态编译的两项N2探针。
- 源码原字节身份沿用archive。A保留历史CRLF、M/R主C为LF；不重写旧hash。正式补丁表示逻辑差异，恢复入口按archive哈希核对原字节。
- 正式启动后campaign.py的源码补充了离线bridge报告入口，但已经运行的Python进程使用启动时载入的代码；
  因此本轮若原自动尾阶段未生成bridge_check/results.md，会在采样/所有VM诊断结束后单独运行bridge_analysis.py。
  这只整理已有证据，不新增性能记录；冻结run/common/engine/input不变。
