import Foundation

let n = Int(readLine()!)!
let pattern = readLine()!.map { String($0) }
let starIndex = pattern.firstIndex(of: "*")!
let pre = pattern[0..<starIndex].joined()
var post = pattern[starIndex...].joined()
post.removeFirst()
for _ in 0..<n {
    let fileName = readLine()!
    if fileName.count < pattern.count - 1 {
        print("NE")
        continue
    }
    if fileName.prefix(pre.count) == pre,
       fileName.suffix(post.count) == post {
        print("DA")
    } else {
        print("NE")
    }
}
