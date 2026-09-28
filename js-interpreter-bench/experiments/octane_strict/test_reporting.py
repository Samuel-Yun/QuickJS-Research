"""Read-only reporting tests: no engine execution or new performance sample."""
import math
import unittest
import xml.etree.ElementTree as ET
import summarize as report
import run_strict as run

class StatisticsTests(unittest.TestCase):
    def test_tukey_30_and_sample_std(self):
        s=report.stats(list(range(1,31)))
        self.assertEqual(s['median'],15.5)
        self.assertEqual(s['iqr'],15)
        self.assertAlmostEqual(s['stddev'],math.sqrt(77.5),12)
        self.assertAlmostEqual(s['cv'],s['stddev']/s['mean'],12)

    def test_nested_suite_equal_weight(self):
        # Two subbenchmarks do not give a suite twice the overall weight.
        first=report.gm([0.25,1]);second=2
        self.assertAlmostEqual(report.gm([first,second]),1)
        self.assertNotAlmostEqual(report.gm([0.25,1,2]),1)

    def test_winners(self):
        w=report.winners([0.5,2,1])
        self.assertEqual((w['quickjs_lower'],w['v8_lower'],w['tie']),(1,1,1))
        self.assertAlmostEqual(w['ratio_geomean'],1)

    def test_svg(self):
        row=dict(suite='A&B',ratio_v8_over_quickjs=0.5,
                 fixed_work_ratio=0.8,native_per_call_ratio=0.6,strict_interpreter_ratio=0.5)
        for comparison in (False,True):
            root=ET.fromstring(report.plot([row],comparison))
            self.assertEqual(root.attrib['width'],'1060')

    def test_driver_has_no_formal_extra_checks(self):
        source=(run.HERE/'driver.js').read_text()
        block=source.split("} else if (mode === 'measure') {")[1].split('} else {')[0]
        self.assertIn('for (i = 0; i < N; i++) test.run();',block)
        self.assertNotIn('decrypt',block)
        self.assertNotIn('check',block)
        self.assertNotIn('Setup',block)

    def test_calibration_minimum_shared_power_of_two(self):
        for (suite,benchmark),n in run.selected().items():
            rows=[r for r in run.read_csv(run.HERE/'raw/calibration.csv')
                  if r['suite']==suite and r['benchmark']==benchmark and int(r['N'])<=n]
            self.assertEqual([int(r['N']) for r in rows],[1<<i for i in range(n.bit_length())])
            self.assertTrue(all(r['status']=='BELOW_TARGET' for r in rows[:-1]))
            self.assertEqual(rows[-1]['status'],'SELECTED')
            self.assertGreaterEqual(float(rows[-1]['quickjs_elapsed_ms']),1000)
            self.assertGreaterEqual(float(rows[-1]['v8_elapsed_ms']),1000)

    def test_schedule_balanced_resume_keys(self):
        import json
        plan=json.loads((run.HERE/'schedule.json').read_text())['samples']
        self.assertEqual(len(plan),960)
        keys=[(r['suite'],r['benchmark'],r['engine'],r['N'],r['iteration']) for r in plan]
        self.assertEqual(len(keys),len(set(keys)))
        for suite,names in run.BENCHMARKS.items():
            for benchmark in names:
                for engine in run.ENGINES:
                    rows=[r for r in plan if (r['suite'],r['benchmark'],r['engine'])==(suite,benchmark,engine)]
                    self.assertEqual(len(rows),30)
                    self.assertEqual(sum(r['execution_order']%2==1 for r in rows),15)

if __name__=='__main__':unittest.main()
