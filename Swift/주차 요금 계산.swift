import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    func calFee(_ uTime: Int) -> Int {
        var basicFee = fees[1]
        
        if uTime > fees[0] {
            basicFee += (uTime - fees[0]) / fees[2] * fees[3]
            if (uTime - fees[0]) % fees[2] != 0 {
                basicFee += fees[3]
            }
        }
        
        return basicFee
    }
    
    var parkingLot: [(Int, Int)] = []
    var accTimes: [Int: Int] = [: ]
    let maxTime = 1439
    
    for record in records {
        let splitedRecord = record.split(separator: " ").map { String($0) }
        let splitedTime = splitedRecord[0].split(separator: ":").map { Int(String($0))! }
        let (time, number, io) = (splitedTime[0] * 60 + splitedTime[1], Int(splitedRecord[1])!, splitedRecord[2])
        
        if accTimes[number] == nil {
            accTimes[number] = 0
        }
        
        if io == "IN" {
            parkingLot.append((number, time))
        } else {
            for idx in 0..<parkingLot.count {
                if parkingLot[idx].0 == number {
                    accTimes[parkingLot[idx].0]! += time - parkingLot[idx].1
                    parkingLot.remove(at: idx)
                    break
                }
            }
        }
    }
    
    for car in parkingLot.reversed() {
        accTimes[car.0]! += maxTime - car.1
        parkingLot.removeLast()
    }

    return accTimes.sorted { $0.key < $1.key }.map { calFee($0.value) }
}
