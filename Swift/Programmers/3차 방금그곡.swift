func solution(_ m:String, _ musicinfos:[String]) -> String {
    var newMusicInfo: [(String, String, Int)] = []
    let sharp = ["C#", "D#", "F#", "G#", "A#"]
    let dict = Dictionary(uniqueKeysWithValues: zip(sharp, Array(0...4).map { String($0) }))
    
    for info in musicinfos {
        let info = info.split(separator: ",").map { String($0) }
        let start = info[0].split(separator: ":").map { Int(String($0))! }.reduce(0) { (60 * $0) + $1 }
        let end = info[1].split(separator: ":").map { Int(String($0))! }.reduce(0) { (60 * $0) + $1 }
        let diff = end - start
        var code = info[3]
        for s in sharp {
            code = code.replacingOccurrences(of: s, with: dict[s]!)
        }
        code = String(repeating: code, count: diff / code.count) + code.prefix(diff % code.count)
        newMusicInfo.append((info[2], code, diff))
    }
    
    var m = m
    for s in sharp {
        m = m.replacingOccurrences(of: s, with: dict[s]!)
    }
    var answer = newMusicInfo.filter { $0.1.contains(m) }.sorted { $0.2 > $1.2 }
    if answer.isEmpty {
        return "(None)"
    }
    return answer[0].0
}
