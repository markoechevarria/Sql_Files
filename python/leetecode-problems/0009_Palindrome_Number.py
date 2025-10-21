class Solution:
    def isPalindrome(self, x: int) -> bool:
        number = []
        for i in str(x):
            number.extend(i)
        while len(number) > 1:
            first_digit = number.pop(0)
            last_digit = number.pop()
            if (first_digit != last_digit):
                return False
        return True
        print(number)