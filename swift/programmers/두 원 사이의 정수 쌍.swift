import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    func greenCircle(_ radius: Int) -> Int {
        var number = 0
        for r in 0...radius {
            let height = Int(sqrt(Double(radius * radius - r * r)))
            number += r == 0 ? height * 2 + 1 : 2 * (height * 2 + 1)
        }
        return number
    }
    
    func blueCircle(_ radius: Int) -> Int {
        var number = 0
        for r in 0...radius {
            let height = sqrt(Double(radius * radius - r * r))
            if height == 0 {
                number += 0
            } else if Double(Int(height)) == height {
                number += Int(height) * 2 - 1
                if r != 0 {
                    number += Int(height) * 2 - 1
                }
            } else {
                number += Int(height) * 2 + 1
                if r != 0 {
                    number += Int(height) * 2 + 1
                }
            }
        }
        return number
    }
    var g = greenCircle(r2)
    var b = blueCircle(r1)
    return Int64(g - b)
}
