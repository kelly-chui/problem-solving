import Foundation

func solution(_ s:String) -> [Int] {
    let newS = Array(s).map { Int(UnicodeScalar(String($0))!.value) - 97 }
    var table = [Int](repeating: -1, count: 26)
    var result = [Int](repeating: -1, count: s.count)
    
    for idx in 0..<newS.count {
        if table[newS[idx]] != -1 {
            result[idx] = idx - table[newS[idx]]
        }
        table[newS[idx]] = idx
    }
    return result
}
