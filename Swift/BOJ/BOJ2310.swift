import Foundation

typealias Room = (npc: String, price: Int, doors: [Int])

func bfs(n: Int, rooms: [Room]) -> Bool {
    var queue = [(Int, Int)]()
    var isVisited = [Bool](repeating: false, count: n + 1)
    queue.append((1, 0))
    isVisited[1] = true
    
    while !queue.isEmpty {
        let (room, money) = queue.removeFirst()
        print("ZZ", room, money)
        for newRoom in rooms[room].doors {
            if isVisited[newRoom] {
                continue
            }
            let newType = rooms[newRoom].npc
            let newPrice = rooms[newRoom].price
            var newMoney = money
            if newType == "L" {
                if newMoney < newPrice {
                    newMoney = newPrice
                }
            } else if newType == "T" {
                if newMoney - newPrice < 0 {
                    continue
                } else {
                    newMoney -= newPrice
                }
            }
            if newRoom == n {
                return true
            }
            queue.append((newRoom, newMoney))
            isVisited[newRoom] = true
        }
    }
    return false
}

while true {
    let n = Int(readLine()!)!
    if n == 0 {
        break
    }
    var rooms = [("", 0, [0])]
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let price = Int(input[1])!
        let doors = input[2...].dropLast().map { Int($0)! }
        rooms.append((input[0], price, doors))
    }
    if bfs(n: n, rooms: rooms) {
        print("Yes")
    } else {
        print("No")
    }
}