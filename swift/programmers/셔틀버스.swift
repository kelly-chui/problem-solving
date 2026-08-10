func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var crew: [Int] = timetable.map { time in
        let tokens = time.split(separator: ":").compactMap { Int($0) }
        return tokens[0] * 60 + tokens[1]
    }.sorted()
    var currentTime = 540 // 09:00
    var crewIndex = 0
    for i in 0..<n {
        var cnt = 0
        while cnt < m && crewIndex < crew.count && crew[crewIndex] <= currentTime {
            crewIndex += 1
            cnt += 1
        }
        if i == n - 1 {
            if cnt < m {
                return String(format: "%02d:%02d", currentTime / 60, currentTime % 60)
            } else {
                let time = crew[crewIndex - 1] - 1
                return String(format: "%02d:%02d", time / 60, time % 60)
            }
        }
        currentTime += t
    }
    return ""
}
