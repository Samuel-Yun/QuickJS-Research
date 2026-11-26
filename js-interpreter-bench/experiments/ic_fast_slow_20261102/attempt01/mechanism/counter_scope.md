# 独立计数的定义（保留原字段名）

计数来自C_diag，不来自正式性能ELF。scope为native Begin/End间、精确源码/实例/PC选中的读点；准备Run和输出在外。数值控制target=0，计数为0，采用比例不适用。

- total_target_reads：选中site进入读取handler的次数；eligible_shape_matches：原有类型/class/exotic/shape守卫通过后进入采用判定的次数。
- offset_reads、forced_normal_lookups：匹配后两种取值路线的次数；它们之和=eligible_shape_matches。forced不是自然shape miss。
- actual_find_own_property_entries：进入该源码inline查找体的次数，不是native函数调用次数。bucket_reads在读hash桶处加一。
- **chain_matches原字段名实际记录`while(h)`中的atom比较/链探查次数，不仅是成功匹配次数。** 本轮三个有目标诊断的查找恰好每次一探查且找到x，因此数值与成功次数相同；不能推广为任意哈希链都只有一次成功/比较。未改写原JSON或CSV字段来掩盖这一命名限制。
- cache_updates：调用rdi_update的次数；shape_retains/releases只数该目标更新路径中的shape引用活动，不包含JSValue的Dup/Free，也不是全进程引用计数。
- matched_instances为编译准备过程中唯一目标匹配数，不是运行中对象数。

稳定N2：每目标8192读、8192守卫匹配，五档分配精确，实际find/bucket/chain探查随forced次数变化，更新/shape活动为0。真实两shape交替N2：8192真实失配、8192普通查找与更新/retain/release，无人工forced或offset读取。后者有替换维护，不能与前者的普通查找成本混同。

这些数据是执行次数，不是耗时占比。没有用计数乘假定常数估时；没有把find计数为0解释为整个属性操作零成本。正式区间不带本计数器。
