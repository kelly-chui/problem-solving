import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack: [String] = []
    var newNumber = Array(number).map { String($0) }
    var count = k
    
    for n in newNumber {
        while !stack.isEmpty && stack.last! < n {
            if count > 0 {
                stack.removeLast()
                count -= 1
            } else {
                break
            }
        }
        stack.append(n)
    }
    
    while count > 0 {
        if let index = stack.firstIndex(of: stack.min()!) {
            stack.remove(at: index)
        }
        count -= 1
    }
    
    return stack.joined()
}
