func solution(_ str1:String, _ str2:String) -> Int {
    var arrayStr1 = Array(str1.lowercased()).map { String($0) }
    var arrayStr2 = Array(str2.lowercased()).map { String($0) }
    var subStr1: Set<String> = []
    var subStr2: Set<String> = []
    
    for idx in 1..<arrayStr1.count {
        if Character(arrayStr1[idx - 1]).isLowercase && Character(arrayStr1[idx]).isLowercase {
            let temp = arrayStr1[idx - 1] + arrayStr1[idx]
            var tupleIdx = 0
            while true {
                if subStr1.contains(temp + String(tupleIdx)) {
                    tupleIdx += 1
                } else {
                    subStr1.insert(temp + String(tupleIdx))
                    break
                }
            }
        }
    }
    
    for idx in 1..<arrayStr2.count {
        if Character(arrayStr2[idx - 1]).isLowercase && Character(arrayStr2[idx]).isLowercase {
            var temp = arrayStr2[idx - 1] + arrayStr2[idx]
            var tupleIdx = 0
            while true {
                if subStr2.contains(temp + String(tupleIdx)) {
                    tupleIdx += 1
                } else {
                    subStr2.insert(temp + String(tupleIdx))
                    break
                }
            }
        }
    }
    
    if subStr1.isEmpty && subStr2.isEmpty {
        return 65536
    } else {
        return Int(Double(subStr1.intersection(subStr2).count) / Double(subStr1.union(subStr2).count) * 65536.0)
    }
}
