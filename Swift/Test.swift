var n = Int(readLine()!)!
var answer = 1
while n > 1 {
    answer *= n
    n -= 1 
}
print(answer)