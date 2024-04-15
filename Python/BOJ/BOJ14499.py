import copy

def north():
    global dice_drct
    original_drct = copy.deepcopy(dice_drct)
    for new, ori in zip(["u", "l", "n", "e", "w", "s"], ["s", "n", "u", "e", "w", "l"]):
        dice_drct[new] = original_drct[ori]

def south():
    global dice_drct
    original_drct = copy.deepcopy(dice_drct)
    for new, ori in zip(["u", "l", "n", "e", "w", "s"], ["n", "s", "l", "e", "w", "u"]):
        dice_drct[new] = original_drct[ori]

def east():
    global dice_drct
    original_drct = copy.deepcopy(dice_drct)
    for new, ori in zip(["u", "l", "n", "e", "w", "s"], ["w", "e", "n", "u", "l", "s"]):
        dice_drct[new] = original_drct[ori]

def west():
    global dice_drct
    original_drct = copy.deepcopy(dice_drct)
    for new, ori in zip(["u", "l", "n", "e", "w", "s"], ["e", "w", "n", "l", "u", "s"]):
        dice_drct[new] = original_drct[ori]

def change():
    if graph[x][y] == 0:
        graph[x][y] = dice_num[dice_drct["l"]]
    else:
        dice_num[dice_drct["l"]] = graph[x][y]
        graph[x][y] = 0

def check(x, y):
    if x < 0 or x >= n or y < 0 or y >=m:
        return False
    return True

n, m, x, y, k = map(int, input().split())
graph = []
for _ in range(n):
    graph.append(list(map(int, input().split())))
orders = list(input().split())

dice_num = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0}
dice_drct = {"u": 1, "l": 6, "n": 2, "e": 3, "w": 4, "s": 5}

for order in orders:
    isTrue = False
    if order == "1":
        if check(x, y + 1):
            y += 1
            east()
            change()
            isTrue = True
    if order == "2":
        if check(x, y - 1):
            y -= 1
            west()
            change()
            isTrue = True
    if order == "3":
        if check(x - 1, y):
            x -= 1
            north()
            change()
            isTrue = True
    if order == "4":
        if check(x + 1, y):
            x += 1
            south()
            change()
            isTrue = True
    if isTrue:
        print(dice_num[dice_drct["u"]])
