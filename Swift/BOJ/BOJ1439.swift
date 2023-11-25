import Foundation

let s = readLine()!
var count = (0, 0)
var newS = String(s.first!)
if s.first == "0" {
    count.0 += 1
} else {
    count.1 += 1
}
for char in s {
    if char != newS.last! {
        if char == Character("0") {
            count.0 += 1
        } else {
            count.1 += 1
        }
        newS.append(char)
    }
}
print(min(count.0, count.1))
