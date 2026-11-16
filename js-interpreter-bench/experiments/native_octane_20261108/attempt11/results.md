# 仅eval来源延迟准备

每个组合17项各5个新进程，共85条新性能样本；旧对照复用。
EVAL_COLD基于READ_STORE，一个固定ELF完整跑17项；COLD_ENTRY另作旧参考。
单位ms/完整Run，五进程中位数。变化为候选/其直接父版-1，负数更快。跨批次探索，区间不含未观测到的环境漂移。

|case|A|READ_STORE|EVAL_COLD|相对READ_STORE|
|---|---:|---:|---:|---:|
|Richards.Richards|2.64284|2.22889|2.22639|-0.11%|
|DeltaBlue.DeltaBlue|5.81005|4.78171|4.83454|+1.10%|
|Crypto.Encrypt|3.80618|3.81222|3.74605|-1.74%|
|Crypto.Decrypt|71.98832|71.58474|70.37010|-1.70%|
|RayTrace.RayTrace|30.58617|28.06210|28.50240|+1.57%|
|EarleyBoyer.Earley|5.50612|5.46057|5.30946|-2.77%|
|EarleyBoyer.Boyer|81.11951|74.07429|74.29940|+0.30%|
|RegExp.RegExp|153.15963|152.42997|152.64585|+0.14%|
|Splay.Splay|1.44648|1.50561|1.46839|-2.47%|
|NavierStokes.NavierStokes|43.89243|41.50613|42.62834|+2.70%|
|PdfJS.PdfJS|123.24001|122.10687|120.46036|-1.35%|
|Mandreel.Mandreel|1234.01386|1181.71505|1158.17571|-1.99%|
|Gameboy.Gameboy|226.98317|210.10018|210.65958|+0.27%|
|CodeLoad.CodeLoadClosure|0.47912|0.51846|0.49081|-5.33%|
|CodeLoad.CodeLoadJQuery|8.81082|9.25680|8.94423|-3.38%|
|Typescript.Typescript|1533.41897|1415.00004|1428.55398|+0.96%|
|zlib.zlib|5224.23831|5009.18488|4801.47113|-4.15%|

|版本|集合|对照|耗时变化|比值95%探索区间|
|---|---|---|---:|---:|
|EVAL_COLD|core16_13suite|A|-5.51%|[0.941223, 0.947293]|
|EVAL_COLD|expanded17_14suite|A|-5.70%|[0.939445, 0.945381]|
|EVAL_COLD|core16_13suite|PREP2|-0.75%|[0.987483, 0.994388]|
|EVAL_COLD|expanded17_14suite|PREP2|-0.95%|[0.985525, 0.992528]|
|EVAL_COLD|core16_13suite|READ_STORE|-0.52%|[0.992594, 0.996298]|
|EVAL_COLD|expanded17_14suite|READ_STORE|-0.78%|[0.990087, 0.993839]|
|EVAL_COLD|core16_13suite|COLD_ENTRY|-0.79%|[0.990285, 0.994473]|
|EVAL_COLD|expanded17_14suite|COLD_ENTRY|-0.72%|[0.990952, 0.995249]|

专项语义、C API保存加载/GC/native finalizer、ASan/UBSan和17条负载正确性通过；LSan关闭，不是完整test262。
全部有效慢点保留，没有新A/V8_ON/V8_OFF/SunSpider性能样本。
