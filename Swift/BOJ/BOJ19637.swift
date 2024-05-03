let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var titleDict = Dictionary<Int, String>()
var thresholders = [Int]()

for _ in 0..<n {
    let titleAndPower = readLine()!.split(separator: " ").map { String($0) }
    let (title, power) = (titleAndPower[0], Int(titleAndPower[1])!)
    if titleDict[power] == nil {
        titleDict[power] = title
        thresholders.append(power)
    }
}

for _ in 0..<m {
    let characterPower = Int(readLine()!)!
    var low = 0
    var high = thresholders.count - 1
    
    while low < high {
        let mid = (low + high) / 2
        if thresholders[mid] >= characterPower {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    print(titleDict[thresholders[low]]!)
}
