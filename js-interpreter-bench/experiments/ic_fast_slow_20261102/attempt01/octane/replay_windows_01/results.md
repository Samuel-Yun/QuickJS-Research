# octane：实际统计

有效/实际/目标：2040/2040/2040。所有异常值保留，区间为探索性配对 bootstrap 10000 次。

|case|N|A ms|M ms|U ms|V8_ON ms|
|---|---:|---:|---:|---:|---:|
|Richards.Richards|1024|3.500607|3.285195|3.314360|2.111958|
|DeltaBlue.DeltaBlue|512|7.160680|6.987404|7.010160|3.753890|
|Crypto.Encrypt|512|5.257273|5.025986|5.187359|4.474969|
|Crypto.Decrypt|32|99.170696|96.224540|97.485185|83.674937|
|RayTrace.RayTrace|128|38.570392|40.479431|40.900039|17.343312|
|EarleyBoyer.Earley|512|6.987782|6.888674|6.992267|2.261691|
|EarleyBoyer.Boyer|32|107.285282|104.684766|106.340610|44.891813|
|RegExp.RegExp|64|182.520217|208.452332|183.598074|28.736258|
|Splay.Splay|2048|2.173221|2.295014|2.296072|1.759186|
|NavierStokes.NavierStokes|32|58.591479|55.146272|58.585600|69.866484|
|PdfJS.PdfJS|16|180.877423|179.906037|180.659265|100.698531|
|Mandreel.Mandreel|1|1772.604350|1743.434025|1764.387023|1499.218500|
|Gameboy.Gameboy|8|316.497327|310.906195|312.027331|293.798938|
|CodeLoad.CodeLoadClosure|4096|0.613989|0.666259|0.637870|0.317063|
|CodeLoad.CodeLoadJQuery|512|10.497514|11.120157|10.850176|4.561134|
|Typescript.Typescript|1|2126.035230|2050.856829|2058.222029|1387.119000|
|zlib.zlib|1|8366.149807|8297.293036|8475.038321|7385.846000|

|case|ratio|point|95% CI|direction|
|---|---|---:|---|---|
|Richards.Richards|U/M|1.00888|[1.00267, 1.02009]|numerator_slower|
|Richards.Richards|U/A|0.94680|[0.94164, 0.95583]|numerator_faster|
|Richards.Richards|U/V8_ON|1.56933|[1.56080, 1.58388]|numerator_slower|
|Richards.Richards|M/V8_ON|1.55552|[1.54450, 1.56426]|numerator_slower|
|DeltaBlue.DeltaBlue|U/M|1.00326|[0.99654, 1.01131]|unclear|
|DeltaBlue.DeltaBlue|U/A|0.97898|[0.97433, 0.98519]|numerator_faster|
|DeltaBlue.DeltaBlue|U/V8_ON|1.86744|[1.86080, 1.88028]|numerator_slower|
|DeltaBlue.DeltaBlue|M/V8_ON|1.86138|[1.85396, 1.87480]|numerator_slower|
|Crypto.Encrypt|U/M|1.03211|[1.02589, 1.03486]|numerator_slower|
|Crypto.Encrypt|U/A|0.98670|[0.98367, 0.99091]|numerator_faster|
|Crypto.Encrypt|U/V8_ON|1.15919|[1.15526, 1.16289]|numerator_slower|
|Crypto.Encrypt|M/V8_ON|1.12313|[1.12046, 1.13007]|numerator_slower|
|Crypto.Decrypt|U/M|1.01310|[1.00730, 1.01896]|numerator_slower|
|Crypto.Decrypt|U/A|0.98300|[0.97762, 0.98928]|numerator_faster|
|Crypto.Decrypt|U/V8_ON|1.16505|[1.15963, 1.17617]|numerator_slower|
|Crypto.Decrypt|M/V8_ON|1.14998|[1.14527, 1.15790]|numerator_slower|
|RayTrace.RayTrace|U/M|1.01039|[1.00572, 1.01688]|numerator_slower|
|RayTrace.RayTrace|U/A|1.06040|[1.04915, 1.06623]|numerator_slower|
|RayTrace.RayTrace|U/V8_ON|2.35826|[2.34332, 2.37349]|numerator_slower|
|RayTrace.RayTrace|M/V8_ON|2.33401|[2.31490, 2.34683]|numerator_slower|
|EarleyBoyer.Earley|U/M|1.01504|[1.00615, 1.01953]|numerator_slower|
|EarleyBoyer.Earley|U/A|1.00064|[0.99678, 1.00654]|unclear|
|EarleyBoyer.Earley|U/V8_ON|3.09161|[3.07867, 3.11292]|numerator_slower|
|EarleyBoyer.Earley|M/V8_ON|3.04581|[3.03497, 3.07599]|numerator_slower|
|EarleyBoyer.Boyer|U/M|1.01582|[1.01106, 1.02151]|numerator_slower|
|EarleyBoyer.Boyer|U/A|0.99119|[0.98570, 0.99504]|numerator_faster|
|EarleyBoyer.Boyer|U/V8_ON|2.36882|[2.34942, 2.37902]|numerator_slower|
|EarleyBoyer.Boyer|M/V8_ON|2.33193|[2.31256, 2.34060]|numerator_slower|
|RegExp.RegExp|U/M|0.88077|[0.87857, 0.88309]|numerator_faster|
|RegExp.RegExp|U/A|1.00591|[1.00212, 1.00856]|numerator_slower|
|RegExp.RegExp|U/V8_ON|6.38907|[6.35427, 6.40593]|numerator_slower|
|RegExp.RegExp|M/V8_ON|7.25398|[7.21777, 7.26938]|numerator_slower|
|Splay.Splay|U/M|1.00046|[0.99448, 1.01135]|unclear|
|Splay.Splay|U/A|1.05653|[1.04688, 1.06686]|numerator_slower|
|Splay.Splay|U/V8_ON|1.30519|[1.29042, 1.31934]|numerator_slower|
|Splay.Splay|M/V8_ON|1.30459|[1.28904, 1.31791]|numerator_slower|
|NavierStokes.NavierStokes|U/M|1.06237|[1.05367, 1.06693]|numerator_slower|
|NavierStokes.NavierStokes|U/A|0.99990|[0.99348, 1.00433]|unclear|
|NavierStokes.NavierStokes|U/V8_ON|0.83854|[0.83090, 0.84176]|numerator_faster|
|NavierStokes.NavierStokes|M/V8_ON|0.78931|[0.78511, 0.79398]|numerator_faster|
|PdfJS.PdfJS|U/M|1.00419|[0.99998, 1.00950]|unclear|
|PdfJS.PdfJS|U/A|0.99879|[0.99429, 1.00344]|unclear|
|PdfJS.PdfJS|U/V8_ON|1.79406|[1.78103, 1.80263]|numerator_slower|
|PdfJS.PdfJS|M/V8_ON|1.78658|[1.77191, 1.79573]|numerator_slower|
|Mandreel.Mandreel|U/M|1.01202|[1.00522, 1.02125]|numerator_slower|
|Mandreel.Mandreel|U/A|0.99536|[0.99050, 1.00086]|unclear|
|Mandreel.Mandreel|U/V8_ON|1.17687|[1.17058, 1.18238]|numerator_slower|
|Mandreel.Mandreel|M/V8_ON|1.16290|[1.15161, 1.16828]|numerator_slower|
|Gameboy.Gameboy|U/M|1.00361|[0.99803, 1.01106]|unclear|
|Gameboy.Gameboy|U/A|0.98588|[0.98117, 0.98981]|numerator_faster|
|Gameboy.Gameboy|U/V8_ON|1.06204|[1.05576, 1.06798]|numerator_slower|
|Gameboy.Gameboy|M/V8_ON|1.05823|[1.04903, 1.06330]|numerator_slower|
|CodeLoad.CodeLoadClosure|U/M|0.95739|[0.94648, 0.96670]|numerator_faster|
|CodeLoad.CodeLoadClosure|U/A|1.03889|[1.02991, 1.04766]|numerator_slower|
|CodeLoad.CodeLoadClosure|U/V8_ON|2.01181|[1.98956, 2.04218]|numerator_slower|
|CodeLoad.CodeLoadClosure|M/V8_ON|2.10134|[2.07749, 2.13196]|numerator_slower|
|CodeLoad.CodeLoadJQuery|U/M|0.97572|[0.96836, 0.98041]|numerator_faster|
|CodeLoad.CodeLoadJQuery|U/A|1.03359|[1.02612, 1.04029]|numerator_slower|
|CodeLoad.CodeLoadJQuery|U/V8_ON|2.37883|[2.36280, 2.39021]|numerator_slower|
|CodeLoad.CodeLoadJQuery|M/V8_ON|2.43802|[2.42701, 2.45079]|numerator_slower|
|Typescript.Typescript|U/M|1.00359|[0.98280, 1.01489]|unclear|
|Typescript.Typescript|U/A|0.96810|[0.96159, 0.98163]|numerator_faster|
|Typescript.Typescript|U/V8_ON|1.48381|[1.46752, 1.50303]|numerator_slower|
|Typescript.Typescript|M/V8_ON|1.47850|[1.46528, 1.50910]|numerator_slower|
|zlib.zlib|U/M|1.02142|[1.01616, 1.02448]|numerator_slower|
|zlib.zlib|U/A|1.01302|[1.00675, 1.01799]|numerator_slower|
|zlib.zlib|U/V8_ON|1.14747|[1.14212, 1.15336]|numerator_slower|
|zlib.zlib|M/V8_ON|1.12340|[1.12014, 1.12935]|numerator_slower|

## 固定集合（非官方分数）

{'set': 'core16_13suite', 'ratio': 'U/M', 'point': 0.9987157519376753, 'CI95_low': 0.9966497304390336, 'CI95_high': 1.0008374122313917, 'common_rounds': 30, 'case_count': 16, 'suite_count': 13, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript']}
{'set': 'core16_13suite', 'ratio': 'U/A', 'point': 1.0005576029614693, 'CI95_low': 0.9989389165300109, 'CI95_high': 1.0022764991661939, 'common_rounds': 30, 'case_count': 16, 'suite_count': 13, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript']}
{'set': 'core16_13suite', 'ratio': 'U/V8_ON', 'point': 1.7145210084474178, 'CI95_low': 1.7112573060682914, 'CI95_high': 1.7179138950281219, 'common_rounds': 30, 'case_count': 16, 'suite_count': 13, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript']}
{'set': 'core16_13suite', 'ratio': 'M/V8_ON', 'point': 1.7167257101141749, 'CI95_low': 1.7127929832540474, 'CI95_high': 1.7203407298511573, 'common_rounds': 30, 'case_count': 16, 'suite_count': 13, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript']}
{'set': 'expanded17_14suite', 'ratio': 'U/M', 'point': 1.000320758513476, 'CI95_low': 0.9981902677852178, 'CI95_high': 1.002296871306144, 'common_rounds': 30, 'case_count': 17, 'suite_count': 14, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript', 'zlib.zlib']}
{'set': 'expanded17_14suite', 'ratio': 'U/A', 'point': 1.001442340145348, 'CI95_low': 0.9997701752411295, 'CI95_high': 1.0030953934703188, 'common_rounds': 30, 'case_count': 17, 'suite_count': 14, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript', 'zlib.zlib']}
{'set': 'expanded17_14suite', 'ratio': 'U/V8_ON', 'point': 1.6660405554093396, 'CI95_low': 1.6628838761620073, 'CI95_high': 1.6692158763232372, 'common_rounds': 30, 'case_count': 17, 'suite_count': 14, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript', 'zlib.zlib']}
{'set': 'expanded17_14suite', 'ratio': 'M/V8_ON', 'point': 1.6655063300747202, 'CI95_low': 1.6619534987914746, 'CI95_high': 1.6689700816050421, 'common_rounds': 30, 'case_count': 17, 'suite_count': 14, 'status': 'COMPLETE', 'cases': ['Richards.Richards', 'DeltaBlue.DeltaBlue', 'Crypto.Encrypt', 'Crypto.Decrypt', 'RayTrace.RayTrace', 'EarleyBoyer.Earley', 'EarleyBoyer.Boyer', 'RegExp.RegExp', 'Splay.Splay', 'NavierStokes.NavierStokes', 'PdfJS.PdfJS', 'Mandreel.Mandreel', 'Gameboy.Gameboy', 'CodeLoad.CodeLoadClosure', 'CodeLoad.CodeLoadJQuery', 'Typescript.Typescript', 'zlib.zlib']}
