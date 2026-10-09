class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        seen = set()
        left = 0
        count = 0

        for right in range(len(s)):
            while s[right] in seen:
                seen.remove(s[left])
                left+=1
            
            seen.add(s[right])
            count = max(count,right - left +1)
                
        return count


