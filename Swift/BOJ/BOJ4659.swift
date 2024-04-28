while true {
    let input = readLine()!
    if input == "end" { 
        break
    }
    let consonants = Array("aeiou")
    var cCount = 0
    var vCount = 0
    var dCount = 0
    var preChar: Character = " "
    var isAcceptable = true
    var isC = false
    for char in input {
        if preChar == char {
            if preChar == "e" || preChar == "o" && dCount == 0 {
                dCount += 1
            } else {
                isAcceptable = false
                break
            }
        } else {
            dCount = 0
        }
        if consonants.contains(char) {
            cCount += 1
            vCount = 0
            isC = true
        } else {
            cCount = 0
            vCount += 1
        }
        if cCount >= 3 || vCount >= 3 {
            isAcceptable = false
            break
        }
        preChar = char
    }
    if !isC {
        isAcceptable = false
    }

    if isAcceptable {
        print("<\(input)> is acceptable.")
    } else {
        print("<\(input)> is not acceptable.")
    }
}