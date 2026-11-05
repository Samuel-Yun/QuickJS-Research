import unittest
from analyze import quartiles,stats,percentile
from common import CASES,CONDITIONS
class Tests(unittest.TestCase):
    def test_matrix(self):self.assertEqual(len(CASES)*len(CONDITIONS)*30,1440)
    def test_correctness(self):self.assertEqual(len(CASES)*len(CONDITIONS)*2,96)
    def test_q(self):self.assertEqual(quartiles(list(range(1,31))),(8,23))
    def test_std(self):self.assertEqual(stats([1,2,3])['sample_stddev'],1)
    def test_percentile(self):self.assertEqual(percentile([0,10],.25),2.5)
if __name__=='__main__':unittest.main()
