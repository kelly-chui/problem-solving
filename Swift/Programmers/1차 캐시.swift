func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    let lowCities = cities.map { $0.lowercased() }
    var answer = 0
    var cache = [(String, Int)](repeating: ("", 0), count: cacheSize)
    
    for i in 1...lowCities.count {
        cache.sort { $0.1 > $1.1 }
        var isHit = false
        for j in 0..<cache.count where !isHit {
            if cache[j].0 == lowCities[i - 1] {
                answer += 1
                cache[j].1 = i
                isHit = true
                break
            }
        }
        if !isHit {
            answer += 5
            cache.removeLast()
            cache.append((lowCities[i - 1], i))
        }
    }

    return answer
}
