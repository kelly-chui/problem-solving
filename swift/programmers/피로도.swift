import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer = 0
    var seq: [Int] = []
    
    var dungeonList: [(Int, Int, Int)] = []
    var dSerial = 0
    for dungeon in dungeons {
        dungeonList.append((dSerial, dungeon[0], dungeon[1]))
        dSerial += 1
    }
    
    func dfs(_ k: Int) {
        for dungeon in dungeonList {
            if seq.contains(dungeon.0) {
                continue
            }
            if k >= dungeon.1 {
                seq.append(dungeon.0)
                answer = max(answer, seq.count)
                dfs(k - dungeon.2)
                seq.removeLast()
            }
        }
    }
    
    dfs(k)
    
    return answer
}
