import Foundation

struct Room: Hashable {
    var food = "root"
    var floor = 0
    var parent: String = ""
}

func dfs(room: Room) {
    for _ in 0..<room.floor {
        print("--", terminator: "")
    }
    print(room.food)
    if let roomList = arrayTree[room] {
        for r in roomList {
            dfs(room: r)
        }
    }
}

let n = Int(readLine()!)!
var tree: [Room: Set<Room>] = [Room(): Set([])]
for _ in 0..<n {
    let k = Array(readLine()!.split(separator: " ").map { String($0) })
    var upstair = Room()
    for index in 1..<k.count {
        let currentRoom = Room(food: k[index], floor: index - 1, parent: String(upstair.food) + String(upstair.floor) + String(upstair.parent))
        tree[upstair, default: []].insert(currentRoom)
        upstair = currentRoom
    }
}

var arrayTree: [Room: Array<Room>] = [:]
for room in tree {
    arrayTree[room.key] = Array(room.value).sorted { $0.food < $1.food }
}

for node in arrayTree[Room()]! {
    dfs(room: node)
}
