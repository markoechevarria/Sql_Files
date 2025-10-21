class Solution:
    def twoSum(self, nums: List[int], target: int)-> List[int]:
        for index1, item1 in enumerate(nums):
            for index2, item2 in enumerate(nums[(index1+1):]):
                if ( target == item1 + item2 ) :
                    return [index1, index2+index1+1]
        return []