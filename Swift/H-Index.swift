import Foundation

func solution(_ citations:[Int]) -> Int {
    var start = 0
    var end = 1000
    var mid = 0
    
    while start <= end {
        mid = (start + end) / 2
        
        var count = 0
        for citation in citations {
            if citation >= mid {
                count += 1
            }
        }
        
        if count >= mid {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return end
}
