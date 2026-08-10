import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var ptr1 = 0
    var ptr2 = 0
    
    for g in goal {
        
        if ptr1 < cards1.count && g == cards1[ptr1] {
            ptr1 += 1
        } else if ptr2 < cards2.count && g == cards2[ptr2] {
            ptr2 += 1
        } else {
            return "No"
        }
    }
    return "Yes"
}
