import Foundation

func solution(_ word:String) -> Int {
    var w = ""
    var words: [String] = []
    
    func dfs(_ len: Int) {
        if w.count == len {
            words.append(w)
            return
        }
        
        for v in ["A", "E", "I", "O", "U"] {
            w += v
            dfs(len)
            w.removeLast()
        }
    }
    
    for idx in 1...5 {
        dfs(idx)
    }
    
    return words.sorted().firstIndex(of: word)! + 1
}
