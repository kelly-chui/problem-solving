import Foundation

func solution(_ relation: [[String]]) -> Int {
    func generateCombinations(_ length: Int, _ start: Int) {
        if combination.count == length {
            allCombinations.append(combination)
            return
        }
        for idx in start..<numColumns {
            combination.append(idx)
            generateCombinations(length, idx + 1)
            combination.removeLast()
        }
    }
    
    let numRows = relation.count
    let numColumns = relation.first!.count
    
    var allCombinations = [[Int]]()
    var combination = [Int]()
    
    for length in 1...numColumns {
        combination = []
        generateCombinations(length, 0)
    }
    
    var candidateKeys = [Set<Int>]()
    
    for columns in allCombinations {
        var isMinimal = true
        for key in candidateKeys {
            if Set(columns).isSuperset(of: key) {
                isMinimal = false
                break
            }
        }
        if !isMinimal {
            continue
        }
        
        var uniqueRows = Set<String>()
        for row in relation {
            let key = columns.map { row[$0] }.joined()
            uniqueRows.insert(key)
        }
        
        if uniqueRows.count == numRows {
            candidateKeys.append(Set(columns))
        }
    }
    
    return candidateKeys.count
}