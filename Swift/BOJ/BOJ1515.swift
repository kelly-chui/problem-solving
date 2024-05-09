import Foundation

let input = readLine()!.map { Int(String($0))! }

var num = 0
var i = 0
while true {
    num += 1
    let ArrayNum = String(num).map { Int(String($0))! }
    for char in ArrayNum {
        if input[i] == char {
            i += 1
            if i == input.count {
                print(num)
                exit(0)
            }
        } 
    }
}
