# 一次性冷函数入口修订

每个组合17项各5个新进程，共85条新性能样本；旧对照复用。
COLD_ENTRY基于READ_STORE，一个固定ELF完整跑17项；ENTRY1另作旧参考。
单位ms/完整Run，五进程中位数。变化为候选/其直接父版-1，负数更快。跨批次探索，区间不含未观测到的环境漂移。

|case|A|READ_STORE|COLD_ENTRY|相对READ_STORE|
|---|---:|---:|---:|---:|
|Richards.Richards|2.64284|2.22889|2.22129|-0.34%|
|DeltaBlue.DeltaBlue|5.81005|4.78171|4.88189|+2.10%|
|Crypto.Encrypt|3.80618|3.81222|3.75195|-1.58%|
|Crypto.Decrypt|71.98832|71.58474|70.43372|-1.61%|
|RayTrace.RayTrace|30.58617|28.06210|30.27723|+7.89%|
|EarleyBoyer.Earley|5.50612|5.46057|5.30733|-2.81%|
|EarleyBoyer.Boyer|81.11951|74.07429|75.08105|+1.36%|
|RegExp.RegExp|153.15963|152.42997|152.06383|-0.24%|
|Splay.Splay|1.44648|1.50561|1.46353|-2.79%|
|NavierStokes.NavierStokes|43.89243|41.50613|43.08430|+3.80%|
|PdfJS.PdfJS|123.24001|122.10687|120.30496|-1.48%|
|Mandreel.Mandreel|1234.01386|1181.71505|1156.75067|-2.11%|
|Gameboy.Gameboy|226.98317|210.10018|211.85976|+0.84%|
|CodeLoad.CodeLoadClosure|0.47912|0.51846|0.48996|-5.50%|
|CodeLoad.CodeLoadJQuery|8.81082|9.25680|8.88707|-3.99%|
|Typescript.Typescript|1533.41897|1415.00004|1467.04049|+3.68%|
|zlib.zlib|5224.23831|5009.18488|4793.44825|-4.31%|

|版本|集合|对照|耗时变化|比值95%探索区间|
|---|---|---|---:|---:|
|COLD_ENTRY|core16_13suite|A|-4.76%|[0.948203, 0.955108]|
|COLD_ENTRY|expanded17_14suite|A|-5.01%|[0.945777, 0.952564]|
|COLD_ENTRY|core16_13suite|PREP2|+0.04%|[0.994806, 1.002706]|
|COLD_ENTRY|expanded17_14suite|PREP2|-0.23%|[0.992168, 1.000170]|
|COLD_ENTRY|core16_13suite|READ_STORE|+0.28%|[0.999301, 1.004761]|
|COLD_ENTRY|expanded17_14suite|READ_STORE|-0.06%|[0.996092, 1.001419]|
|COLD_ENTRY|core16_13suite|ENTRY1|-0.36%|[0.992461, 0.998693]|
|COLD_ENTRY|expanded17_14suite|ENTRY1|-0.69%|[0.989462, 0.995443]|

专项语义、C API保存加载/GC/native finalizer、ASan/UBSan和17条负载正确性通过；LSan关闭，不是完整test262。
全部有效慢点保留，没有新A/V8_ON/V8_OFF/SunSpider性能样本。
