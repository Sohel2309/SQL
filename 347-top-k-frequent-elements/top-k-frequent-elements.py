from collections import Counter,defaultdict
class Solution(object):
    def topKFrequent(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """
        dict1 = defaultdict()

        for num in nums:
            dict1[num] = dict1.get(num,0) + 1
        
        return sorted(dict1 , key = dict1.get , reverse=True)[:k]
        