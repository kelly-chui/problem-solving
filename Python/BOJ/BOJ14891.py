class Gear():
    def __init__(self, stat):
        self.__stat = stat
        self.__top = 0
        self.__left = 6
        self.__right = 2

    def rotate(self, drct):
        self.__top = (self.__top - drct) % 8
        self.__left = (self.__left - drct) % 8
        self.__right = (self.__right - drct) % 8

    @property
    def top(self):
        return self.__stat[self.__top]
    @property
    def left(self):
        return self.__stat[self.__left]
    @property
    def right(self):
        return self.__stat[self.__right]

def left_shift(gear_num, drct):
    new_drct = drct * -1
    cur_gear = gear_num
    for next_gear in range(gear_num - 1, 0, -1):
        if gears[next_gear].right != gears[cur_gear].left:
            rotate_queue.append((next_gear, new_drct))
            cur_gear = next_gear
            new_drct *= -1
        else:
            break

def right_shift(gear_num, drct):
    new_drct = drct * -1
    cur_gear = gear_num
    for next_gear in range(gear_num + 1, 5):
        if gears[next_gear].left != gears[cur_gear].right:
            rotate_queue.append((next_gear, new_drct))
            cur_gear = next_gear
            new_drct *= -1
        else: 
            break

gear1 = Gear(list(map(int, input())))
gear2 = Gear(list(map(int, input())))
gear3 = Gear(list(map(int, input())))
gear4 = Gear(list(map(int, input())))
gears = [None, gear1, gear2, gear3, gear4]

k = int(input())
answer = 0

rotate_queue = []

for _ in range(k):
    num, drct = map(int, input().split())
    rotate_queue.append((num, drct))
    left_shift(num, drct)
    right_shift(num, drct)
    for g, d in rotate_queue:
        gears[g].rotate(d)
    rotate_queue = []

rank = 1
for idx in range(1, 5):
    answer += gears[idx].top * rank
    rank *= 2

print(answer)