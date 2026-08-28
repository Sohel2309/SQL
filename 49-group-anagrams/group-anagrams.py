from collections import defaultdict, Counter
class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """

        groups = defaultdict(list)
        for x in strs:
            key = tuple(sorted(Counter(x).items()))
            groups[key].append(x)

        return groups.values()

