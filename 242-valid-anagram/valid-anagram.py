from collections import Counter,defaultdict
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        dict1 = defaultdict()
        dict2 = defaultdict()

        for char in s:
            dict1[char] = dict1.get(char,0) + 1
        
        for i in t:
            dict2[i] = dict2.get(i,0) + 1
        
        if dict1 == dict2:
            return True
        
        return False
        
