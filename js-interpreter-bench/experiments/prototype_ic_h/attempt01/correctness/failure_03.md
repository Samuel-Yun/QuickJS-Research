H.internal.build.json 保留内部 C 测试首次编译失败。
测试误将 js_shape_prepare_update 写为两参数；当前源码第三参数为
JSShapeProperty **pprs，允许 NULL（quickjs.c:10302–10326）。
修正仅给测试调用补 NULL，用 build2 新日志再次构建。
Release H、已有语义/生命周期/诊断 raw 不变，尚未正式计时。
