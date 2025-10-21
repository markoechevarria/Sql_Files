class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        lista = []
        for i1, m in enumerate(nums):
            for i2, n in enumerate(nums):
                for i3, p in enumerate(nums):
                    if (i1 != i2) and (i2 != i3) and (i1 != i3):
                        if (m + n + p == 0):
                            if len(lista) > 0:
                                duplicate = False
                                for value_lista in lista:
                                    if self.is_duplicate(value_lista, list((m,n,p))):
                                        duplicate = True
                                if duplicate == False:
                                    lista.append([m, n, p])
                            else: lista.append([m,n,p])
        return lista

    def is_duplicate(self, list1: List[int], list2: List[int]) -> bool:
        new_list1 = list1.copy()
        new_list2 = list2.copy()
        auxiliar_list = []
        for val1 in list1:
            for val2 in list2:
                if val1 == val2:
                    if (val1 in new_list1) and (val2 in new_list2):
                        new_list1.remove(val1)
                        new_list2.remove(val2)
        if len(new_list1) != 0:
            return False
        else: return True