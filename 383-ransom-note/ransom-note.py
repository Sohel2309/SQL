from collections import defaultdict
class Solution(object):
    def canConstruct(self, ransomNote, magazine):
        """
        :type ransomNote: str
        :type magazine: str
        :rtype: bool
        """
        dict1 = defaultdict()
        dict2 = defaultdict()

        for char in ransomNote:
            dict1[char] = dict1.get(char,0) + 1
        
        for i in magazine:
            dict2[i] = dict2.get(i,0) + 1
        
        for key,value in dict1.items():
            if key not in dict2 or dict2[key] <value:
                return False
        return True



