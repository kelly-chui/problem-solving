def share(tree, profitTable, seller, profit):
    if seller == "-" or profit < 1:
        return
    shareProfit = profit // 10
    profitTable[seller] += (profit - shareProfit)
    share(tree, profitTable, tree[seller], shareProfit)

def solution(enroll, referral, seller, amount):
    tree = {}
    profitTable = {}
    for enrollee, referrer in zip(enroll, referral):
        tree[enrollee] = referrer
        profitTable[enrollee] = 0
    for seller, amount in zip(seller, amount):
        share(tree, profitTable, seller, amount * 100)
    return [profitTable[enrollee] for enrollee in enroll]
