from collections import Counter
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        freq = Counter(s)
        freq1 = Counter(t)

        if freq == freq1:
            return True
        else:
            return False