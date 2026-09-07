from collections import defaultdict
class Solution(object):
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        dict1 = defaultdict()

        for n in nums:
            dict1[n] = dict1.get(n,0) + 1
        
        for key, value in dict1.items():
            if value > len(nums)/2:
                return key
        
        


