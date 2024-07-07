import Foundation

var s = Array(readLine()!)
var p = Array(readLine()!)
var answer = 0
var i = 0
while i < p.count {
    var maxCommonLength = 0
    for j in 0..<s.count {
        var commonLength = 0
        while j + commonLength < p.count && i + commonLength < p.count && s[j + commonLength] == p[i + commonLength] {
            commonLength += 1
        }
     maxCommonLength = max(maxCommonLength, commonLength)
    }
    i += maxCommonLength
    answer += 1
}

print(answer)