# 固定版本映射与获取限制

2026-10-25通过官方Gitiles页面核对：refs/tags/15.6.21指向37fb84941c9be9f9914ee50b1ad366f06a1bd764，commit说明为Version 15.6.21。
来源：https://chromium.googlesource.com/v8/v8/+/refs/tags/15.6.21

这只是版本tag的参考映射，不证明官方prebuilt二进制恰由该commit、某套完整GN参数构建。实际制品source_commit、完整toolchain仍UNKNOWN。
flag-definitions.h、ic.cc、runtime-test.cc、accessor-assembler.cc、interpreter-generator.cc的小文件获取均失败，原始错误在fetch.json：TLS证书链含不受信任的自签名证书。
官方Gitiles文件页及官方GitHub镜像的浏览器访问也未取得所需文件；只取得版本tag页。没有关闭TLS校验、私自添加证书、改系统信任或改用当前main/相近版本源码冒充。

因此以下问题保留UNKNOWN：该版本use_ic对named/keyed/global load/store的精确控制范围，OFF保留的反馈/handler/其它缓存，以及jitless的全部源码隐含规则。
实际binary的help/有效flag差异可独立核对，但不能代替上述源码结论。
