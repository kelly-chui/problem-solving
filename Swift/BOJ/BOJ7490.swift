import Foundation

func calcuate() {
    var rawExpression = ""
    for idx in 0..<n - 1 {
        rawExpression += String(seq[idx])
        rawExpression += cal[idx]
    }
    rawExpression += String(seq[n - 1])
    
    let expression = rawExpression.replacingOccurrences(of: " ", with: "")
    var numbers = [Int]()
    var operators = [Character]()
    var numBuffer = ""
    for element in expression {
        if element.isNumber {
            numBuffer.append(element)
        } else {
            numbers.append(Int(numBuffer)!)
            operators.append(element)
            numBuffer = ""
        }
    }
    if let lastNumber = Int(numBuffer) {
        numbers.append(lastNumber)
    }

    var result = numbers[0]
    for idx in 0..<operators.count {
        if operators[idx] == "-" {
            result -= numbers[idx + 1] 
        } else {
            result += numbers[idx + 1]
        }
    }
    if result == 0 {
        print(rawExpression)
    }
}

func dfs() {
    if cal.count == n - 1 {
        calcuate()
        return
    }
    for op in [" ", "+", "-"] {
        cal.append(op)
        dfs()
        cal.removeLast()
    }
}

let t = Int(readLine()!)!

var n = Int()
var seq = [Int]()
var cal = [String]()

for _ in 0..<t {
    n = Int(readLine()!)!
    seq = Array(1...n)
    cal = []
    dfs()
    print()
}
