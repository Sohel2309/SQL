class Solution(object):
    def twoSum(self, nums, target):

        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        seen = {}

        for i in range(len(nums)):
            needed = target - nums[i]
            if needed in seen:
                return (i ,seen[needed])
            else : seen[nums[i]] = i




                


            

