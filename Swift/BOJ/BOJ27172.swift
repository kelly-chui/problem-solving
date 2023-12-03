import Foundation

let n = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted { $0 < $1 }
let maxCard = x.last!
for idx in 0..<x.count {
    let card = x[idx]
    if card = 1 {
        // 1일때 처리
        continue
    }
    var count = 2
    while card * count <= maxCard {
        
    }
}