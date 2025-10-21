class Solution:
    def runningSum(self, nums):
        for i in range(len(nums)):
            if (i != 0):
                nums[i] = nums[i] + nums[i-1]
        return nums