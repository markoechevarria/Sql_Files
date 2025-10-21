class Solution:
    def maximumWealth(self, accounts):
        customers = []
        for i in range(len(accounts)):
            customers.append( sum( accounts[i][:] ) )
        return max(customers)