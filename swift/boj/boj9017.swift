let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let table = readLine()!.split(separator: " ").map { Int($0)! }
    var countDict = Dictionary<Int, Int>()
    var scoreDict = Dictionary<Int, (Int, Int, Int)>()
    for runner in table {
        countDict[runner, default: 0] += 1
    }
    var score = 1
    for idx in 0..<n {
        if countDict[table[idx]]! != 6 {
            continue
        }
        scoreDict[table[idx], default: (0, 0, -1)].0 += 1
        if scoreDict[table[idx]]!.0 <= 4 {
            scoreDict[table[idx]]!.1 += score
        }
        if scoreDict[table[idx]]!.0 == 5 {
            scoreDict[table[idx]]!.2 = score
        }
        score += 1
    }

    let sortedScore = scoreDict.sorted { 
        if $0.value.1 != $1.value.1 {
            return $0.value.1 < $1.value.1
        } else {
            return $0.value.2 < $1.value.2
        }
    }
    print(sortedScore.first!.key)
}
