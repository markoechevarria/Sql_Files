class Solution: 
    def sortedSquares(self, nums: List[int]) -> List[int]:
        squares = [x**2 for x in nums]
        maxivalue = max(squares)
        lista = [0] * (maxivalue+1)
        for i in squares:
            lista[i] += 1
        new_list = []
        for j in range(len(lista)):
            if lista[j] != 0:
                auxiliar_list = [j] * lista[j]
                new_list.extend(auxiliar_list)
        return new_list