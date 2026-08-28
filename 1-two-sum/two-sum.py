class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        for x in range(len(nums)):
            for y in range(len(nums)):
                if x != y:
                    if nums[x] + nums[y] == target:
                        return(x,y)
                   



                


            

