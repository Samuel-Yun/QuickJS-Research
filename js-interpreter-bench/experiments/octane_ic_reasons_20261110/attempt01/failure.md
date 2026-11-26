# 原因计数构建失败，未运行任何性能或原因诊断

QuickJS 在内部将 free 宏重定义为 free_is_forbidden，原因计数器使用 libc calloc
分配的辅助元数据在释放时被此宏拦截，编译失败。所有源码和 build.log 保留。
后续仅在独立诊断头内 push/undef/pop free 宏，用 libc free 释放这些辅助分配；
QuickJS 正常源码的宏和内存管理不变。修正后新建 attempt02，不覆盖本目录。
