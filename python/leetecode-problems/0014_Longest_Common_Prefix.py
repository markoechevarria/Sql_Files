class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        list_strs = list(strs)
        index = 0
        
        while (True):
            auxiliar = []
            for word in list_strs:
                if len(word) == index:
                    return list_strs[0][:index]
                if not (word[index] in auxiliar ):
                    auxiliar.append(word[index])
            if (len(auxiliar) != 1):
                if (index == 0):
                    return ""
                else:
                    return list_strs[0][:index]
            else:
                index += 1