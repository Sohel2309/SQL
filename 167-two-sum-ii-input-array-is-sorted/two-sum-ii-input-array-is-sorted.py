class Solution(object):
    def twoSum(self, numbers, target):
        """
        :type numbers: List[int]
        :type target: int
        :rtype: List[int]
        """
        seen = {}
        left = 0

        for right in range(len(numbers)):
            needed = target - numbers[right]
            if needed in seen:
                return [seen[needed]+1,left+1]
            else:
                seen[numbers[right]] = right
            left+=1
        