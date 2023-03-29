import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let (h, w) = (park.count, park[0].count)
    let dict: [String: (Int, Int)] = ["N": (-1, 0), "E": (0, 1), "W": (0, -1), "S": (1, 0)]
    var location = (0, 0)
    var isFindLocation = false
    
    
    for row in 0..<h where !isFindLocation {
        for column in 0..<w {
            if String(Array(park[row])[column]) == "S" {
                location = (row, column)
                isFindLocation = true
                break
            }
        }
    }
    
    for route in routes {
        let command = route.split(separator: " ").map { String($0) }
        var newLocation = location
        var idx = 0
        var isPossible = true
        while idx < Int(command[1])! {
            newLocation.0 += dict[String(command[0])]!.0
            newLocation.1 += dict[String(command[0])]!.1
            if newLocation.0 >= h || newLocation.0 < 0 || newLocation.1 >= w || newLocation.1 < 0 {
                isPossible = false
                break
            }
            if String(Array(park[newLocation.0])[newLocation.1]) == "X" {
                isPossible = false
                break
            }
            idx += 1
        }
        
        location = isPossible ? newLocation : location
    }
    return [location.0 , location.1]
}

