import Foundation

let s = readLine()!
var t = readLine()!
var counts = (t: t.count, s:s.count)


while counts.t > counts.s {
    if t.last! == Character("A") {
        t.removeLast()
        counts.t -= 1
    } else {
        t.removeLast()
        t = String(t.reversed())
        counts.t -= 1
    }
}

print(s == t ? 1 : 0)
