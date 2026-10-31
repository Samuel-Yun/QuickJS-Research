# 按规范函数/源码/最终PC对齐的生命周期观察

全进程独立诊断，不是timed-region self-time；CodeLoad双方N<=8。重复编译实例只按family聚合，不用instance_id/指针强配对。
source/code/PC唯一且总读数相等才标unique_static_site；其它为family或UNKNOWN，保留差异不强行分配原因。

## Richards.Richards

匹配family 311；M-only 0，R-only 0；唯一可对齐静态点 274。
唯一退出点的R−M命中差 0；未退出点的命中差 0。这些是位置相关计数，不是时间归因。

| 函数 | PC | 属性 | M替换 | R替换 | R退出 | M命中 | R命中 | 身份 |
|---|---:|---|---:|---:|---:|---:|---:|---|

完整规范身份与计数见lifetime_site_alignment.json，原始每site均在raw/diagnostic的对应M/R归档。

## RayTrace.RayTrace

匹配family 816；M-only 0，R-only 0；唯一可对齐静态点 712。
唯一退出点的R−M命中差 -15550；未退出点的命中差 0。这些是位置相关计数，不是时间归因。

| 函数 | PC | 属性 | M替换 | R替换 | R退出 | M命中 | R命中 | 身份 |
|---|---:|---|---:|---:|---:|---:|---:|---|
|  | 396 | isHit | 5055 | 0 | 1 | 6592 | 0 | unique_static_site |
|  | 594 | isHit | 0 | 0 | 1 | 4479 | 0 | unique_static_site |
|  | 733 | isHit | 0 | 0 | 1 | 4479 | 0 | unique_static_site |

完整规范身份与计数见lifetime_site_alignment.json，原始每site均在raw/diagnostic的对应M/R归档。

## Splay.Splay

匹配family 266；M-only 0，R-only 0；唯一可对齐静态点 244。
唯一退出点的R−M命中差 0；未退出点的命中差 0。这些是位置相关计数，不是时间归因。

| 函数 | PC | 属性 | M替换 | R替换 | R退出 | M命中 | R命中 | 身份 |
|---|---:|---|---:|---:|---:|---:|---:|---|
|  | 43 | key | 1118759 | 1118759 | 0 | 1307355 | 1307355 | unique_static_site |
|  | 138 | key | 677311 | 677311 | 0 | 726231 | 726231 | unique_static_site |
|  | 147 | right | 592131 | 592131 | 0 | 647567 | 647567 | unique_static_site |
|  | 157 | right | 570107 | 570107 | 0 | 577470 | 577470 | unique_static_site |

完整规范身份与计数见lifetime_site_alignment.json，原始每site均在raw/diagnostic的对应M/R归档。

## Typescript.Typescript

匹配family 24260；M-only 0，R-only 0；唯一可对齐静态点 24206。
唯一退出点的R−M命中差 -1403171；未退出点的命中差 0。这些是位置相关计数，不是时间归因。

| 函数 | PC | 属性 | M替换 | R替换 | R退出 | M命中 | R命中 | 身份 |
|---|---:|---|---:|---:|---:|---:|---:|---|
|  | 21 | isParenthesized | 147653 | 13350 | 1 | 102518 | 9438 | unique_static_site |
|  | 95 | isParenthesized | 147653 | 13350 | 1 | 102518 | 9438 | unique_static_site |
|  | 67 | nodeType | 227551 | 336 | 1 | 63753 | 157 | unique_static_site |
| cleanASTType | 70 | nodeType | 107656 | 3718 | 1 | 33643 | 1193 | unique_static_site |

完整规范身份与计数见lifetime_site_alignment.json，原始每site均在raw/diagnostic的对应M/R归档。

