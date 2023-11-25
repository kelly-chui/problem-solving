import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var rooms = 0
    var hotelStats: [(Int, Bool)] = []
    for time in book_time {
        let timeComponents = time.map { $0.split(separator: ":").map { Int(String($0))! } }
        let totalMinutes = timeComponents.map { $0[0] * 60 + $0[1] }
        hotelStats.append((totalMinutes[0], true))
        hotelStats.append((totalMinutes[1] + 10, false))
    }
    
    hotelStats.sort {
        if $0.0 != $1.0 {
            return $0.0 < $1.0
        } else {
            return !($0.1 && !$1.1)
        }
    }
    
    var answer = 0
    for stat in hotelStats {
        rooms += stat.1 ? 1 : -1
        answer = max(answer, rooms)
    }
    
    return answer
}
