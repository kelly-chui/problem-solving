p, m = map(int, input().split())
room_list = []
for _ in range(p):
    l, n = input().split()
    l = int(l)
    is_matched = False
    for room in room_list:
        if l >= room[0] - 10 and l <= room[0] + 10 and len(room[1]) < m:
            room[1].append((l, n))
            is_matched = True
            break
    if not is_matched:
        room_list.append((l, [(l, n)]))
        is_matched = True

for room in room_list:
    if len(room[1]) == m:
        print("Started!")
    else:
        print("Waiting!")
    for player in sorted(room[1], key=lambda x: x[1]):
        print(player[0], player[1])
