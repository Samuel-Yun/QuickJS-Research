# sunspider：实际统计

有效/实际/目标：3120/3120/3120。所有异常值保留，区间为探索性配对 bootstrap 10000 次。

|case|N|A ms|M ms|U ms|V8_ON ms|
|---|---:|---:|---:|---:|---:|
|3d-cube|128|21.230115|21.116275|21.387328|18.159059|
|3d-morph|128|13.543538|13.286042|13.713856|18.364152|
|3d-raytrace|128|15.313739|15.432565|15.989121|15.257113|
|access-binary-trees|256|12.352235|12.343372|12.347406|5.881535|
|access-fannkuch|64|36.000833|35.218264|36.360927|34.399352|
|access-nbody|128|15.772424|15.484843|15.352095|20.712172|
|access-nsieve|256|18.955970|18.838197|18.807147|10.098215|
|bitops-3bit-bits-in-byte|256|9.273397|9.371451|9.056380|7.039146|
|bitops-bits-in-byte|128|19.460439|19.655379|19.838199|19.692195|
|bitops-bitwise-and|256|7.238033|7.380009|7.308316|9.242531|
|bitops-nsieve-bits|128|14.135087|14.300891|14.428950|23.020770|
|controlflow-recursive|256|7.199989|7.214700|7.311880|6.487629|
|crypto-aes|128|14.567827|14.593049|14.827644|13.949145|
|crypto-md5|256|6.850422|6.813488|6.859560|7.633045|
|crypto-sha1|256|6.526966|6.600156|6.489397|8.603203|
|date-format-tofte|256|29.579305|29.864986|30.183148|8.904371|
|date-format-xparb|512|22.129546|22.042041|22.086532|4.215350|
|math-cordic|128|22.997736|21.734946|22.644568|17.330754|
|math-partial-sums|128|11.317057|11.197831|11.476762|12.172090|
|math-spectral-norm|256|8.573606|8.482648|8.464856|8.703711|
|regexp-dna|256|66.688948|79.483327|66.615394|7.885498|
|string-base64|256|15.645850|15.868185|15.962526|6.422271|
|string-fasta|128|24.076283|23.905083|23.993871|10.330797|
|string-tagcloud|256|22.840488|24.525214|23.030382|7.148322|
|string-unpack-code|256|43.302304|43.892091|43.326199|6.691268|
|string-validate-input|256|11.510156|11.801398|11.641379|6.131869|

|case|ratio|point|95% CI|direction|
|---|---|---:|---|---|
|3d-cube|U/M|1.01284|[1.00724, 1.01595]|numerator_slower|
|3d-cube|U/A|1.00741|[1.00026, 1.01213]|numerator_slower|
|3d-cube|U/V8_ON|1.17778|[1.16728, 1.18222]|numerator_slower|
|3d-cube|M/V8_ON|1.16285|[1.15266, 1.17012]|numerator_slower|
|3d-morph|U/M|1.03220|[1.02198, 1.04127]|numerator_slower|
|3d-morph|U/A|1.01258|[1.00424, 1.02077]|numerator_slower|
|3d-morph|U/V8_ON|0.74677|[0.74143, 0.75047]|numerator_faster|
|3d-morph|M/V8_ON|0.72348|[0.71546, 0.73193]|numerator_faster|
|3d-raytrace|U/M|1.03606|[1.02533, 1.04685]|numerator_slower|
|3d-raytrace|U/A|1.04410|[1.03250, 1.05459]|numerator_slower|
|3d-raytrace|U/V8_ON|1.04798|[1.03968, 1.05957]|numerator_slower|
|3d-raytrace|M/V8_ON|1.01150|[1.00667, 1.02056]|numerator_slower|
|access-binary-trees|U/M|1.00033|[0.99691, 1.00759]|unclear|
|access-binary-trees|U/A|0.99961|[0.99451, 1.00752]|unclear|
|access-binary-trees|U/V8_ON|2.09935|[2.08648, 2.11584]|numerator_slower|
|access-binary-trees|M/V8_ON|2.09867|[2.08346, 2.11430]|numerator_slower|
|access-fannkuch|U/M|1.03245|[1.02364, 1.04245]|numerator_slower|
|access-fannkuch|U/A|1.01000|[1.00484, 1.01853]|numerator_slower|
|access-fannkuch|U/V8_ON|1.05702|[1.04809, 1.06737]|numerator_slower|
|access-fannkuch|M/V8_ON|1.02381|[1.01663, 1.03281]|numerator_slower|
|access-nbody|U/M|0.99143|[0.98071, 0.99726]|numerator_faster|
|access-nbody|U/A|0.97335|[0.96228, 0.97686]|numerator_faster|
|access-nbody|U/V8_ON|0.74121|[0.73373, 0.74453]|numerator_faster|
|access-nbody|M/V8_ON|0.74762|[0.74177, 0.75345]|numerator_faster|
|access-nsieve|U/M|0.99835|[0.99236, 1.00908]|unclear|
|access-nsieve|U/A|0.99215|[0.98614, 1.00028]|unclear|
|access-nsieve|U/V8_ON|1.86242|[1.84897, 1.87943]|numerator_slower|
|access-nsieve|M/V8_ON|1.86550|[1.84369, 1.87769]|numerator_slower|
|bitops-3bit-bits-in-byte|U/M|0.96638|[0.95873, 0.97316]|numerator_faster|
|bitops-3bit-bits-in-byte|U/A|0.97660|[0.96585, 0.98357]|numerator_faster|
|bitops-3bit-bits-in-byte|U/V8_ON|1.28657|[1.27953, 1.29830]|numerator_slower|
|bitops-3bit-bits-in-byte|M/V8_ON|1.33133|[1.32441, 1.34328]|numerator_slower|
|bitops-bits-in-byte|U/M|1.00930|[0.99885, 1.02426]|unclear|
|bitops-bits-in-byte|U/A|1.01941|[1.01021, 1.03269]|numerator_slower|
|bitops-bits-in-byte|U/V8_ON|1.00741|[1.00052, 1.01965]|numerator_slower|
|bitops-bits-in-byte|M/V8_ON|0.99813|[0.99160, 1.00644]|unclear|
|bitops-bitwise-and|U/M|0.99029|[0.98269, 0.99688]|numerator_faster|
|bitops-bitwise-and|U/A|1.00971|[1.00150, 1.02053]|numerator_slower|
|bitops-bitwise-and|U/V8_ON|0.79073|[0.78287, 0.79609]|numerator_faster|
|bitops-bitwise-and|M/V8_ON|0.79848|[0.79122, 0.80523]|numerator_faster|
|bitops-nsieve-bits|U/M|1.00895|[1.00282, 1.02228]|numerator_slower|
|bitops-nsieve-bits|U/A|1.02079|[1.01379, 1.03473]|numerator_slower|
|bitops-nsieve-bits|U/V8_ON|0.62678|[0.62129, 0.63542]|numerator_faster|
|bitops-nsieve-bits|M/V8_ON|0.62122|[0.61711, 0.62528]|numerator_faster|
|controlflow-recursive|U/M|1.01347|[1.00315, 1.01985]|numerator_slower|
|controlflow-recursive|U/A|1.01554|[1.00968, 1.02137]|numerator_slower|
|controlflow-recursive|U/V8_ON|1.12705|[1.11852, 1.13654]|numerator_slower|
|controlflow-recursive|M/V8_ON|1.11207|[1.10471, 1.12143]|numerator_slower|
|crypto-aes|U/M|1.01608|[1.00086, 1.03553]|numerator_slower|
|crypto-aes|U/A|1.01784|[1.00762, 1.03100]|numerator_slower|
|crypto-aes|U/V8_ON|1.06298|[1.05704, 1.07703]|numerator_slower|
|crypto-aes|M/V8_ON|1.04616|[1.03433, 1.06069]|numerator_slower|
|crypto-md5|U/M|1.00676|[1.00186, 1.01409]|numerator_slower|
|crypto-md5|U/A|1.00133|[0.98929, 1.01304]|unclear|
|crypto-md5|U/V8_ON|0.89867|[0.88702, 0.90769]|numerator_faster|
|crypto-md5|M/V8_ON|0.89263|[0.88230, 0.89815]|numerator_faster|
|crypto-sha1|U/M|0.98322|[0.97494, 0.99328]|numerator_faster|
|crypto-sha1|U/A|0.99424|[0.98884, 1.00442]|unclear|
|crypto-sha1|U/V8_ON|0.75430|[0.74877, 0.76184]|numerator_faster|
|crypto-sha1|M/V8_ON|0.76717|[0.76205, 0.77143]|numerator_faster|
|date-format-tofte|U/M|1.01065|[1.00410, 1.02234]|numerator_slower|
|date-format-tofte|U/A|1.02041|[1.01058, 1.03031]|numerator_slower|
|date-format-tofte|U/V8_ON|3.38970|[3.34748, 3.42128]|numerator_slower|
|date-format-tofte|M/V8_ON|3.35397|[3.30253, 3.38519]|numerator_slower|
|date-format-xparb|U/M|1.00202|[0.99751, 1.01028]|unclear|
|date-format-xparb|U/A|0.99806|[0.99168, 1.00800]|unclear|
|date-format-xparb|U/V8_ON|5.23955|[5.16393, 5.28864]|numerator_slower|
|date-format-xparb|M/V8_ON|5.22899|[5.14774, 5.27545]|numerator_slower|
|math-cordic|U/M|1.04185|[1.03462, 1.04789]|numerator_slower|
|math-cordic|U/A|0.98464|[0.97685, 0.99026]|numerator_faster|
|math-cordic|U/V8_ON|1.30661|[1.28901, 1.31693]|numerator_slower|
|math-cordic|M/V8_ON|1.25413|[1.23595, 1.26333]|numerator_slower|
|math-partial-sums|U/M|1.02491|[1.01544, 1.03563]|numerator_slower|
|math-partial-sums|U/A|1.01411|[1.00810, 1.02303]|numerator_slower|
|math-partial-sums|U/V8_ON|0.94288|[0.93253, 0.95563]|numerator_faster|
|math-partial-sums|M/V8_ON|0.91996|[0.91184, 0.92815]|numerator_faster|
|math-spectral-norm|U/M|0.99790|[0.98716, 1.00783]|unclear|
|math-spectral-norm|U/A|0.98732|[0.97912, 1.00052]|unclear|
|math-spectral-norm|U/V8_ON|0.97256|[0.96377, 0.98295]|numerator_faster|
|math-spectral-norm|M/V8_ON|0.97460|[0.96835, 0.98111]|numerator_faster|
|regexp-dna|U/M|0.83811|[0.83464, 0.84466]|numerator_faster|
|regexp-dna|U/A|0.99890|[0.99605, 1.00635]|unclear|
|regexp-dna|U/V8_ON|8.44784|[8.38370, 8.50790]|numerator_slower|
|regexp-dna|M/V8_ON|10.07968|[10.00674, 10.10682]|numerator_slower|
|string-base64|U/M|1.00595|[0.99760, 1.01408]|unclear|
|string-base64|U/A|1.02024|[1.01262, 1.02711]|numerator_slower|
|string-base64|U/V8_ON|2.48550|[2.45284, 2.51126]|numerator_slower|
|string-base64|M/V8_ON|2.47081|[2.43822, 2.49668]|numerator_slower|
|string-fasta|U/M|1.00371|[0.99751, 1.01287]|unclear|
|string-fasta|U/A|0.99658|[0.98567, 1.00560]|unclear|
|string-fasta|U/V8_ON|2.32256|[2.29901, 2.34386]|numerator_slower|
|string-fasta|M/V8_ON|2.31396|[2.28979, 2.33021]|numerator_slower|
|string-tagcloud|U/M|0.93905|[0.92964, 0.94315]|numerator_faster|
|string-tagcloud|U/A|1.00831|[1.00321, 1.01406]|numerator_slower|
|string-tagcloud|U/V8_ON|3.22179|[3.19685, 3.23966]|numerator_slower|
|string-tagcloud|M/V8_ON|3.43090|[3.40748, 3.46507]|numerator_slower|
|string-unpack-code|U/M|0.98711|[0.97895, 0.99174]|numerator_faster|
|string-unpack-code|U/A|1.00055|[0.98873, 1.00901]|unclear|
|string-unpack-code|U/V8_ON|6.47504|[6.39525, 6.51619]|numerator_slower|
|string-unpack-code|M/V8_ON|6.55961|[6.48453, 6.62013]|numerator_slower|
|string-validate-input|U/M|0.98644|[0.97438, 0.99604]|numerator_faster|
|string-validate-input|U/A|1.01140|[1.00478, 1.01775]|numerator_slower|
|string-validate-input|U/V8_ON|1.89850|[1.88656, 1.90862]|numerator_slower|
|string-validate-input|M/V8_ON|1.92460|[1.90923, 1.94701]|numerator_slower|

## 固定集合（非官方分数）

{'set': 'all26_case_equal', 'ratio': 'U/M', 'point': 0.9967304729855883, 'CI95_low': 0.9952495395130682, 'CI95_high': 0.9986623737879302, 'common_rounds': 30, 'case_count': 26, 'suite_count': 26, 'status': 'COMPLETE', 'cases': ['3d-cube', '3d-morph', '3d-raytrace', 'access-binary-trees', 'access-fannkuch', 'access-nbody', 'access-nsieve', 'bitops-3bit-bits-in-byte', 'bitops-bits-in-byte', 'bitops-bitwise-and', 'bitops-nsieve-bits', 'controlflow-recursive', 'crypto-aes', 'crypto-md5', 'crypto-sha1', 'date-format-tofte', 'date-format-xparb', 'math-cordic', 'math-partial-sums', 'math-spectral-norm', 'regexp-dna', 'string-base64', 'string-fasta', 'string-tagcloud', 'string-unpack-code', 'string-validate-input']}
{'set': 'all26_case_equal', 'ratio': 'U/A', 'point': 1.0050842123804407, 'CI95_low': 1.0035873742373824, 'CI95_high': 1.007374189169302, 'common_rounds': 30, 'case_count': 26, 'suite_count': 26, 'status': 'COMPLETE', 'cases': ['3d-cube', '3d-morph', '3d-raytrace', 'access-binary-trees', 'access-fannkuch', 'access-nbody', 'access-nsieve', 'bitops-3bit-bits-in-byte', 'bitops-bits-in-byte', 'bitops-bitwise-and', 'bitops-nsieve-bits', 'controlflow-recursive', 'crypto-aes', 'crypto-md5', 'crypto-sha1', 'date-format-tofte', 'date-format-xparb', 'math-cordic', 'math-partial-sums', 'math-spectral-norm', 'regexp-dna', 'string-base64', 'string-fasta', 'string-tagcloud', 'string-unpack-code', 'string-validate-input']}
{'set': 'all26_case_equal', 'ratio': 'U/V8_ON', 'point': 1.5273002847311763, 'CI95_low': 1.5239420600433187, 'CI95_high': 1.5305349404442543, 'common_rounds': 30, 'case_count': 26, 'suite_count': 26, 'status': 'COMPLETE', 'cases': ['3d-cube', '3d-morph', '3d-raytrace', 'access-binary-trees', 'access-fannkuch', 'access-nbody', 'access-nsieve', 'bitops-3bit-bits-in-byte', 'bitops-bits-in-byte', 'bitops-bitwise-and', 'bitops-nsieve-bits', 'controlflow-recursive', 'crypto-aes', 'crypto-md5', 'crypto-sha1', 'date-format-tofte', 'date-format-xparb', 'math-cordic', 'math-partial-sums', 'math-spectral-norm', 'regexp-dna', 'string-base64', 'string-fasta', 'string-tagcloud', 'string-unpack-code', 'string-validate-input']}
{'set': 'all26_case_equal', 'ratio': 'M/V8_ON', 'point': 1.532310214371523, 'CI95_low': 1.5288060517950222, 'CI95_high': 1.5350820646093177, 'common_rounds': 30, 'case_count': 26, 'suite_count': 26, 'status': 'COMPLETE', 'cases': ['3d-cube', '3d-morph', '3d-raytrace', 'access-binary-trees', 'access-fannkuch', 'access-nbody', 'access-nsieve', 'bitops-3bit-bits-in-byte', 'bitops-bits-in-byte', 'bitops-bitwise-and', 'bitops-nsieve-bits', 'controlflow-recursive', 'crypto-aes', 'crypto-md5', 'crypto-sha1', 'date-format-tofte', 'date-format-xparb', 'math-cordic', 'math-partial-sums', 'math-spectral-norm', 'regexp-dna', 'string-base64', 'string-fasta', 'string-tagcloud', 'string-unpack-code', 'string-validate-input']}
