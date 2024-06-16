import Foundation

func solution(_ name: String) -> Int {
    var alphabetChangeMoves = 0
    var minCursorMoves = name.count - 1
    let nameArray = Array(name)
    
    for (i, char) in nameArray.enumerated() {
        alphabetChangeMoves += min(Int(char.asciiValue!) - Int(Character("A").asciiValue!), Int(Character("Z").asciiValue!) - Int(char.asciiValue!) + 1)
        
        var nextIndex = i + 1
        while nextIndex < nameArray.count && nameArray[nextIndex] == "A" {
            nextIndex += 1
        }
        
        minCursorMoves = min(minCursorMoves, 2 * i + nameArray.count - nextIndex, i + 2 * (nameArray.count - nextIndex))
    }
    
    return alphabetChangeMoves + minCursorMoves
}