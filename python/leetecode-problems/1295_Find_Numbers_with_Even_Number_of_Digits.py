class Solution:
    def findNumbers(self, nums: List[int]) -> int:
        counter = 0
        for i in nums:
            num_dig = len(str(i))
            if num_dig % 2 == 0:
                counter += 1
        return counter