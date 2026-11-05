# 保留的失败与恢复

- 初始网络：sandbox原生git连接失败；WSL git证书链错误。使用获准的Windows原生git从官方HTTPS获取，不关闭TLS校验。source_history.git保留精确历史。
- 源码身份初稿的git格式参数错误，`*_identity.txt`含字面fuller，未作为证据；正确完整元数据保存为`*_identity_v2.txt`，旧文件不覆盖。
- 初始port构造断言及B_port1构建失败：NG的`prop_hash_end`布局和`bool`不能直接用于upstream。`raw/build/B_release.1.{json,log}`保留具体错误。仅适配布局/API后新建B_port2，成功构建在`B_release.2.*`，正式冻结只使用B_port2/v2 patch。
- A的第一次qjsc生成可执行文件失败，缺少libquickjs.a，见`A_qjsc_executable.1.*`；按上游Makefile构建静态库后新的日志`.2.*`通过。没有伪装初次成功。
- `qjs --help`正常显示帮助但退出码为1；A/B帮助日志保留，不当作运行JS回归。
- zlib的N1/N2、A/B四次均失败（read未定义），原stderr保留`raw/correctness/zlib.zlib/`。这是双方已有shell能力限制，不因性能方向筛选。Box2D可运行但缺可信结果门禁，单列不排名。
- 正式960进程：零失败、零重试、零删除；pilot/校准、sanitizer和诊断不混入正式。
- 诊断原始记录及CSV已生成后，第一次`diagnostic_analysis.py`在零查询unit上执行`None:.4f`而抛TypeError；已仅修文字显示为N/A。没有修改原计数，没有补跑正式。相应计数的零分母仍在CSV中留空。
- 正式RSS出现启动器高水位平台。保留正式原值与旧SVG，不宣称其低位相等为真实qjs占用相等；单独完成102次GNU time内存检查与小shell方法控制，见`analysis/rss_method.json`、`rss_floor_control.json`。
- Crypto随机padding未逐对冻结，作为协议限制报告；未改写原程序或事后删除时间样本。`analysis/crypto_sensitivity.json`只做排除该suite的派生汇总。

以上恢复均未改变已经冻结的formal runner、N、顺序、JS或正式binary，也没有覆盖失败raw。
