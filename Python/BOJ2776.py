import sys

t = int(sys.stdin.readline())
for _ in range(t):
    note1 = sys.stdin.readline()
    note1Contents = set(map(int, sys.stdin.readline().split()))
    note2 = sys.stdin.readline()
    note2Contents = list(map(int, sys.stdin.readline().split()))

    note1Sorted = sorted(note1Contents)
    for note2Content in note2Contents:
        if note2Content in note1Contents:
            print(1)
        else:
            print(0)