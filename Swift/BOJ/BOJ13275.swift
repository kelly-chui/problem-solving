import Foundation

func manacher(arr: [Character]) -> Int {
    var processedArray = ["#"]
    processedArray += arr.flatMap { [String($0), "#"] }
    
    var palindromeLengths = [Int](repeating: 0, count: processedArray.count)
    var center = 0
    var rightBoundary = 0
    
    for i in 0..<processedArray.count {
        let mirror = 2 * center - i
        if i < rightBoundary {
            palindromeLengths[i] = min(rightBoundary - i, palindromeLengths[mirror])
        }
        var left = i - (1 + palindromeLengths[i])
        var right = i + (1 + palindromeLengths[i])
        while left >= 0 && right < processedArray.count && processedArray[left] == processedArray[right] {
            palindromeLengths[i] += 1
            left -= 1
            right += 1
        }
        if i + palindromeLengths[i] > rightBoundary {
            center = i
            rightBoundary = i + palindromeLengths[i]
        }
    }
    
    return palindromeLengths.max() ?? 1
}

let exampleArray = Array(readLine()!)
let resultArray = manacher(arr: exampleArray)
print(resultArray)