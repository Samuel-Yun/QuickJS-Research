# mechanism：实际统计

有效/实际/目标：630/630/630。所有异常值保留，区间为探索性配对 bootstrap 10000 次。

|case|N|A ms|M ms|C100 ms|C75 ms|C50 ms|C25 ms|C0 ms|
|---|---:|---:|---:|---:|---:|---:|---:|---:|
|M1.own_integer|32768|0.061708|0.057303|0.060953|0.061805|0.063423|0.065401|0.064128|
|M2.own_reference|32768|0.081086|0.078176|0.080875|0.083505|0.085601|0.086473|0.088789|
|M4.numeric_control|65536|0.038491|0.037168|0.039809|0.039792|0.039340|0.039740|0.039621|

|case|ratio|point|95% CI|direction|
|---|---|---:|---|---|
|M1.own_integer|C100/M|1.06370|[1.05253, 1.08122]|numerator_slower|
|M1.own_integer|C0/C100|1.05209|[1.04017, 1.06231]|numerator_slower|
|M1.own_integer|C75/C100|1.01398|[0.99738, 1.03698]|unclear|
|M1.own_integer|C50/C100|1.04053|[1.01735, 1.06362]|numerator_slower|
|M1.own_integer|C25/C100|1.07298|[1.06015, 1.08357]|numerator_slower|
|M1.own_integer|C100/A|0.98776|[0.97474, 1.00437]|unclear|
|M1.own_integer|M/A|0.92861|[0.91401, 0.93942]|numerator_faster|
|M2.own_reference|C100/M|1.03453|[1.02284, 1.04622]|numerator_slower|
|M2.own_reference|C0/C100|1.09785|[1.08647, 1.11338]|numerator_slower|
|M2.own_reference|C75/C100|1.03251|[1.02125, 1.04521]|numerator_slower|
|M2.own_reference|C50/C100|1.05844|[1.03372, 1.07302]|numerator_slower|
|M2.own_reference|C25/C100|1.06922|[1.05841, 1.09233]|numerator_slower|
|M2.own_reference|C100/A|0.99740|[0.98540, 1.00722]|unclear|
|M2.own_reference|M/A|0.96411|[0.95248, 0.97139]|numerator_faster|
|M4.numeric_control|C100/M|1.07106|[1.04573, 1.09315]|numerator_slower|
|M4.numeric_control|C0/C100|0.99527|[0.97919, 1.01789]|unclear|
|M4.numeric_control|C75/C100|0.99956|[0.97848, 1.02037]|unclear|
|M4.numeric_control|C50/C100|0.98820|[0.96591, 1.01898]|unclear|
|M4.numeric_control|C25/C100|0.99826|[0.96856, 1.01866]|unclear|
|M4.numeric_control|C100/A|1.03426|[1.01858, 1.05223]|numerator_slower|
|M4.numeric_control|M/A|0.96564|[0.94938, 0.98810]|numerator_faster|
