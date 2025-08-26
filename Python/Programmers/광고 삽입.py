def formatTimeToInt(time):
    h, m, s = map(int, time.split(":"))
    return h * 3600 + m * 60 + s

def formatIntToTime(second):
    h = second // 3600
    m = (second % 3600) // 60
    s = second % 60
    return f"{h:02}:{m:02}:{s:02}"

def solution(play_time, adv_time, logs):
    playSeconds = formatTimeToInt(play_time)
    advSeconds = formatTimeToInt(adv_time)
    timeLine = [0] * (playSeconds + 1)
    for log in logs:
        s, e = map(formatTimeToInt, log.split("-"))
        timeLine[s] += 1
        timeLine[e] -= 1
    for i in range(1, playSeconds + 1):
        timeLine[i] += timeLine[i - 1]
    timeLine = timeLine[:-1]  # 0..T-1
    acc = [0] * (playSeconds + 1)
    for i in range(playSeconds):
        acc[i + 1] = acc[i] + timeLine[i]
    bestT = 0
    bestSum = acc[advSeconds] - acc[0]
    for t in range(1, playSeconds - advSeconds + 1):
        cur = acc[t + advSeconds] - acc[t]
        if cur > bestSum:
            bestSum = cur
            bestT = t
    return formatIntToTime(bestT)
