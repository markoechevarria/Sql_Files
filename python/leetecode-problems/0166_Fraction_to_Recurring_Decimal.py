class Solution:
    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        result = numerator/denominator
        result = str(result)
        return result

    def findpattern(self, decimal: int) -> int:
        lista = []
        word = ""
        for i, a in enumerate(decimal):
            for j, b in enumerate(decimal):
                word += a
                