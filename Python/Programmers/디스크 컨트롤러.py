import heapq

def solution(jobs):
    jobs.sort(key = lambda x: x[0])
    waitQueue = []
    finished = 0
    currentTime = 0
    jobIdx = 0
    totalReturnTime = 0
    while finished < len(jobs):
        while jobIdx < len(jobs) and jobs[jobIdx][0] <= currentTime:
            requestTime, duration = jobs[jobIdx]
            heapq.heappush(waitQueue, (duration, requestTime))
            jobIdx += 1
        if waitQueue:
            duration, requestTime = heapq.heappop(waitQueue)
            currentTime += duration
            returnTime = currentTime - requestTime
            totalReturnTime += returnTime
            finished += 1
        else:
            currentTime = jobs[jobIdx][0]
    return totalReturnTime // len(jobs)
