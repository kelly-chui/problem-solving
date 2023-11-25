import Foundation

let n = Int(readLine()!)!
var extensionDict = [String: Int]()
for _ in 0..<n {
    let fileName = readLine()!.split(separator: ".").map { String($0) }
    extensionDict[fileName[1], default: 0] += 1
}
for (key, value) in extensionDict.sorted(by: { $0.key < $1.key }) {
    print(key, value)
}
