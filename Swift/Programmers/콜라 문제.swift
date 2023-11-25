import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var bottles = n
    var answer = 0
    while bottles >= a {
        answer += b * (bottles / a)
        bottles = b * (bottles / a) + (bottles % a)
    }
    return answer
}
