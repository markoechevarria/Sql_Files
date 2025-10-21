class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        lista = []
        for i in range(1, n+1):
            if i % 15 == 0:
                lista.append("FizzBuzz")
            elif i % 3 == 0: 
                lista.append("Fizz")
            elif i % 5 == 0: 
                lista.append("Buzz")
            else:
                lista.append(str(i))
        return lista