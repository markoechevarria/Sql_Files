class Solution:
    def numberOfPairs(self, points: List[List[int]]) -> int:
        counts = 0
        for index1, item1 in enumerate(points):
            for index2, item2 in enumerate(points[index1+1:]):
                
                position = self.setLeftRight(item1, item2)
                otherpoints = points[:]
                
                del otherpoints[index1]
                del otherpoints[index2+index1]

                if (len(otherpoints) != 0):
                    if position == 1:
                        amount = self.verifySpace( item1, item2, otherpoints )
                        counts += amount
                    elif position == -1:
                        amount = self.verifySpace( item2, item1, otherpoints )
                        counts += amount
                    else:
                        pass
                else: 
                    if position == 0:
                        pass
                    else: counts += 1
        return counts
        
    def setLeftRight(self, firstpoint:List[int], secondpoint:List[int]):
        if ( 
            ( firstpoint[0] <= secondpoint[0] ) and
            ( firstpoint[1] >= secondpoint[1] )
        ): return 1
        elif (
            ( secondpoint[0] <= firstpoint[0] ) and
            ( secondpoint[1] >= firstpoint[1] )
        ): return -1
        else: return 0
        
    def verifySpace(self, left_point:List[int], right_point:List[int], otherpoints: List[List[int]]):
        for i in otherpoints:
            if ( 
                ( i[0] >= left_point[0] and i[0] <= right_point[0] ) and
                ( i[1] <= left_point[1] and i[1] >= right_point[1] )
            ): return 0
        return 1