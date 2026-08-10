import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    var count = 0
    
    func dfs(_ len: Int) {
        if len > numbers.count {
            if answer == target {
                count += 1
            }
            return
        }
        
        answer += numbers[len - 1]
        dfs(len + 1)
        answer = answer - (2 * numbers[len - 1])
        dfs(len + 1)
        answer += numbers[len - 1]
    }
    
    dfs(1)
    
    return count
}
