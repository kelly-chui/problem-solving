import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var answer = 0
    let data = data.sorted { $0[col - 1] != $1[col - 1] ? $0[col - 1] < $1[col - 1] : $0[0] > $1[0] }
    for idx in row_begin...row_end {
        let s = data[idx - 1].map { $0 % idx }.reduce(0) { $0 + $1 }
        answer ^= s
    }
    return answer
}
