"""Small deterministic tests, no VM and no empirical performance claims."""
import unittest
from analyze import quartiles,percentile,stats
class StatisticsTests(unittest.TestCase):
    def test_halves(self):self.assertEqual(quartiles(list(range(1,31))),(8,23))
    def test_odd(self):self.assertEqual(quartiles([1,2,3,4,5]),(1.5,4.5))
    def test_sample_sd(self):self.assertEqual(stats([1,2,3])['sample_stddev'],1)
    def test_percentile(self):self.assertEqual(percentile([0,10],.25),2.5)
if __name__=='__main__':unittest.main()
