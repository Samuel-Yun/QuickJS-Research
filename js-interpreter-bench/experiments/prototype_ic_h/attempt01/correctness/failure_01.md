初版 lifecycle.js 在冻结 A 上失败（raw/commands/A.regression.lifecycle.json）。
getter 重入测试先把 nested.x 从 19 更新成 23，第二次却仍断言其为 19，
所以未抛出预期 token；随后异常身份断言也失败。此为新测试的预期错误，
不是 H 回归。原脚本及失败输出保留；lifecycle_v2.js 依据赋值顺序修正预期。
这不改变正式 workload、VM 或之前 96 条正确性记录。重跑用新日志名称。
