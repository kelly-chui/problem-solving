let n = Int(readLine()!)!
let buildings = readLine()!.split(separator: " ").map { Double($0)! }
var count = [Int](repeating: 0, count: n)

for a in 0..<n - 1 {
    for b in a + 1..<n {
        let gradient = (buildings[a] - buildings[b]) / Double(a - b)
        var isVisible = true
        for building in a + 1..<b {
            if Double(building - a) * gradient + buildings[a] <= buildings[building] {
                isVisible = false
                break
            }
        }
        if isVisible {
            count[a] += 1
            count[b] += 1
        }
    }
}
print(count.max()!)