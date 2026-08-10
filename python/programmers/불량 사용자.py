def compare(strA, strB):
    if len(strA) != len(strB):
        return False
    for char in zip(strA, strB):
        if char[0] != char[1] and char[1] != '*':
            return False
    return True
    
def dfs(user_id, banned_id, index, candidateSet, idSet):
    if index == len(banned_id):
        idSet.add(frozenset(candidateSet))
        return
    for id in user_id:
        if id in candidateSet:
            continue
        if compare(id, banned_id[index]):
            dfs(user_id, banned_id, index + 1, candidateSet + [id], idSet)

def solution(user_id, banned_id):
    idSet = set()
    dfs(user_id, banned_id, 0, [], idSet)
    return len(idSet)
