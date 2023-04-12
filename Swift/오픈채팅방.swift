import Foundation

func solution(_ record:[String]) -> [String] {
    var users: [String: String] = [: ]
    var answer: [String] = []
    
    for r in record {
        let commands = r.split(separator: " ").map { String($0) }
        if commands[0] == "Leave" {
            continue
        }
        users[commands[1]] = commands[2]
    }
    
    for r in record {
        let commands = r.split(separator: " ").map { String($0) }
        switch commands[0] {
            case "Enter":
            answer.append("\(users[commands[1]]!)님이 들어왔습니다.")
            case "Leave":
            answer.append("\(users[commands[1]]!)님이 나갔습니다.")
            default:
            continue
        }
    }
    
    return answer
}
