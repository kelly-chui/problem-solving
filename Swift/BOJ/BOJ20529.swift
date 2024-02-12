func compare(_ str1: String, _ str2: String) -> Int {   
    var differentCount = 0
    for (char1, char2) in zip(str1, str2) {
        if char1 != char2 {
            differentCount += 1
        }
    }
    return differentCount
}

func dfs(_ len: Int, _ s: Int) {
    if len == 3 {
        let temp = compare(selected[0], selected[1]) + compare(selected[2], selected[1]) + compare(selected[0], selected[2])
        if answer > temp {
            answer = temp
        }
        return
    }

    for idx in s..<students.count {
        selected.append(students[idx])
        dfs(len + 1, idx + 1)
        selected.removeLast()
    }
}

let rawValues = ["ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP", "ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ"]

let t = Int(readLine()!)!
var n = Int()
var students = [String]()
var selected = [String]()
var answer = Int()

for _ in 0..<t {
    n = Int(readLine()!)!
    students = [String]()
    selected = [String]()
    answer = Int()

    let mbtiArray = readLine()!.split(separator: " ").map { String($0) }
    answer = 987_654_321
    var countDict: [String: Int] = [:]
    for mbti in mbtiArray {
        if countDict[mbti, default: 0] < 3 {
            students.append(mbti)
            countDict[mbti, default: 0] += 1
        }
    }
    dfs(0, 0)
    print(answer)
}