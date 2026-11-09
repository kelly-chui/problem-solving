# https://leetcode.com/problems/process-tasks-using-servers

import heapq

class Solution:
    def assignTasks(self, servers: list[int], tasks: list[int]) -> list[int]:
        n = len(servers)
        m = len(tasks)
        busyServers = []
        freeServers = []
        time = 0
        answer = []

        for server, weight in enumerate(servers):
            heapq.heappush(freeServers, (weight, server))
        for task, duration in enumerate(tasks):
            time = time if time > task else task
            while busyServers and busyServers[0][0] <= time:
                end, weight, server = heapq.heappop(busyServers)
                heapq.heappush(freeServers, (weight, server))
            if not freeServers:
                time = busyServers[0][0]
                while busyServers and busyServers[0][0] <= time:
                    end, weight, server = heapq.heappop(busyServers)
                    heapq.heappush(freeServers, (weight, server))
            weight, server = heapq.heappop(freeServers)
            answer.append(server)
            heapq.heappush(busyServers, (time + duration, weight, server))
        return answer
