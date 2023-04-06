import Foundation

func solution(_ s:String) -> [Int] {
    var newS = Array(s).map { String($0) }
    var answer: [Int] = []
    var setA: Set<Int> = []
    newS.removeLast()
    newS.removeLast()
    newS.removeFirst()
    newS.removeFirst()
    
    var elements = newS.joined().components(separatedBy: "},{").map { $0.split(separator: ",").map { Int(String($0))! } }
    elements.sort { $0.count < $1.count }
    
    for element in elements {
        for e in element {
            if !setA.contains(e) {
                setA.insert(e)
                answer.append(e)
            }
        }
    }
    
    return answer
}
