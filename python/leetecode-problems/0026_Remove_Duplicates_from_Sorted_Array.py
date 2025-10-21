class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        auxiliar_list = []
        counter = 0
        for index, num in enumerate(nums):
            if not (num in auxiliar_list):
                auxiliar_list.append(num)
            else:
                counter += 1
        nums = auxiliar_list.copy()
        extra = ["_"] * counter
        nums.extend(extra)
        print(nums)
        return len(nums)