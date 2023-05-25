import Foundation

func count(_ letter: String, _ n: Int) {
    switch letter {
    case "A": numOfElements.a += n
    case "C": numOfElements.c += n
    case "G": numOfElements.g += n
    case "T": numOfElements.t += n
    default: break
    }
}

func compare() {
    if threshold.0 <= numOfElements.a,
       threshold.1 <= numOfElements.c,
       threshold.2 <= numOfElements.g,
       threshold.3 <= numOfElements.t {
        answer += 1
    }
}

let sp = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s, p) = (sp[0], sp[1])
let arrayDNA = Array(readLine()!).map { String($0) }
let acgt = readLine()!.split(separator: " ").map { Int(String($0))! }
let threshold = (acgt[0], acgt[1], acgt[2], acgt[3])
var numOfElements = (a: 0, c: 0, g: 0, t: 0)
var pointers = (start: 0, end: p - 1)
var answer = 0

for index in 0..<p {
    count(arrayDNA[index], 1)
}
compare()

while pointers.end < s - 1 {
    count(arrayDNA[pointers.start], -1)
    count(arrayDNA[pointers.end + 1], 1)
    pointers.start += 1
    pointers.end += 1
    compare()
}

print(answer)
