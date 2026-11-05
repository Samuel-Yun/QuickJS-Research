# micro：实际统计

有效/实际/目标：270/270/270。所有异常值保留，区间为探索性配对 bootstrap 10000 次。

|case|N|A ms|M ms|U ms|
|---|---:|---:|---:|---:|
|M1.own_integer|32768|0.059155|0.058777|0.063329|
|M2.own_reference|32768|0.077764|0.075368|0.076003|
|M4.numeric_control|65536|0.037123|0.035655|0.038781|

|case|ratio|point|95% CI|direction|
|---|---|---:|---|---|
|M1.own_integer|U/M|1.07746|[1.05696, 1.08484]|numerator_slower|
|M1.own_integer|U/A|1.07057|[1.05407, 1.07794]|numerator_slower|
|M2.own_reference|U/M|1.00843|[1.00205, 1.02162]|numerator_slower|
|M2.own_reference|U/A|0.97735|[0.97316, 0.98910]|numerator_faster|
|M4.numeric_control|U/M|1.08766|[1.06190, 1.10284]|numerator_slower|
|M4.numeric_control|U/A|1.04465|[1.02728, 1.06392]|numerator_slower|
