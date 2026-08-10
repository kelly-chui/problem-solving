import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var arraySkill = Array(skill).map { String($0) }
    var newSt = skill_trees
    var dict = Dictionary(uniqueKeysWithValues: zip(arraySkill, 0..<arraySkill.count))
    
    for a in arraySkill {
        newSt = newSt.map { $0.replacingOccurrences(of: a, with: String(dict[a]!)) }
    }
    
    var nnewSt = newSt.map { Array($0).filter { $0.isNumber }.map { Int(String($0))! } }
    return nnewSt.filter { $0 == Array(0..<$0.count) }.count
}
