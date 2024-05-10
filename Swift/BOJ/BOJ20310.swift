let s = Array(readLine()!)
let oneCount = s.filter { $0 == "1" }.count
let zeroCount = s.count - oneCount
var deleteQueue = [Int]()


for idx in 0..<s.count {
    if s[idx] == "1" {
        deleteQueue.append(idx)
        if deleteQueue.count == oneCount / 2 {
            break
        }        
    }
}

for idx in (0..<s.count).reversed() {
    if s[idx] == "0" {
        deleteQueue.append(idx)
        if deleteQueue.count == oneCount / 2 + zeroCount / 2 {
            break
        }
    }
}

var answer = [Character]()

for idx in 0..<s.count {
    if deleteQueue.contains(idx) {
        continue
    }
    answer.append(s[idx])
}

print(String(answer))