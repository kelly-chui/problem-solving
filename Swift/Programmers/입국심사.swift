import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var low = 1
    var high = times.max()! * n / times.count
    while low < high {
        let mid = (low + high) / 2
        let throughput = times.map { mid / $0 }.reduce(0) { $0 + $1 }
        if throughput < n {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return Int64(high)
}
