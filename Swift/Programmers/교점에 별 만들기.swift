// https://school.programmers.co.kr/learn/courses/30/lessons/87377

import Foundation

typealias Line = (a: Int, b: Int, c: Int)
typealias Point = (x: Int, y: Int)
func findIntersection(_ line1: [Int], _ line2: [Int]) -> (Double, Double) {
    let x = Double(line1[1] * line2[2] - line1[2] * line2[1]) / Double(line1[0] * line2[1] - line1[1] * line2[0])
    let y = Double(line1[2] * line2[0] - line1[0] * line2[2]) / Double(line1[0] * line2[1] - line1[1] * line2[0])
    return (x, y)
}
func solution(_ line:[[Int]]) -> [String] {
    var intersections = [Point]()
    for i in line.indices {
        for j in i + 1..<line.count {
            let intersection = findIntersection(line[i], line[j])
            guard intersection.0.truncatingRemainder(dividingBy: 1) == 0 && intersection.1.truncatingRemainder(dividingBy: 1) == 0 else { continue }
            intersections.append((Int(intersection.0), Int(intersection.1)))
        }
    }
    let maxX = intersections.max { $0.x < $1.x }?.x ?? 0
    let maxY = intersections.max { $0.y < $1.y }?.y ?? 0
    let minX = intersections.min { $0.x < $1.x }?.x ?? 0
    let minY = intersections.min { $0.y < $1.y }?.y ?? 0
    print(maxX, maxY, minX, minY)
    var graph = [[Character]](repeating: [Character](repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    // 1. minX만큼, minY만큼 뺀 만큼 shift 하기 (원점에 맞추기)
    // 2. 배열 순서 뒤집기
    // 3. x축은 column, y축은 row
    for point in intersections {
        graph[point.y - minY][point.x - minX] = "*"
    }
    let answer = graph.reversed().map { String($0) }
    return answer
}
