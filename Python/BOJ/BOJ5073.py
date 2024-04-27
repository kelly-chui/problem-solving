while True:
    side1, side2, side3 = map(int, input().split())
    arr = sorted([side1, side2, side3])
    long = arr[2]
    mid = arr[1]
    short = arr[0]
    if long + mid + short == 0:
        break
    if short + mid <= long:
        print("Invalid")
        continue
    if long == mid and mid == short:
        print("Equilateral")
        continue
    elif long == mid or mid == short:
        print("Isosceles")
        continue
    else:
        print("Scalene")
        continue