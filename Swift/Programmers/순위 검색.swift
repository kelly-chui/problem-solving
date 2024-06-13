import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer: [Int] = []
    var informations: [[String]] = []
    var langSets: Dictionary<String, Set<Int>> = ["cpp": [], "java": [], "python": []] // cpp, java, python
    var groupSets: Dictionary<String, Set<Int>> = ["backend": [], "frontend": []] // backend, frontend
    var careerSets: Dictionary<String, Set<Int>> = ["junior": [], "senior": []] // junior, senior
    var foodSets: Dictionary<String, Set<Int>> = ["chicken": [], "pizza": []] // chicken, pizza
    
    var eigenIndex = 0
    for i in info {
        let personal = i.split(separator: " ").map { String($0) }
        informations.append([personal[0], personal[1], personal[2], personal[3], personal[4]])
        langSets[personal[0], default: []].insert(eigenIndex)
        groupSets[personal[1], default: []].insert(eigenIndex)
        careerSets[personal[2], default: []].insert(eigenIndex)
        foodSets[personal[3], default: []].insert(eigenIndex)
        eigenIndex += 1
    }
    
    var superSets = [langSets, groupSets, careerSets, foodSets]
    for q in query {
        let separatedQuery = q.components(separatedBy: " and ")
        let foodScore = separatedQuery[3].split(separator: " ").map { String($0) }
        let condition = [separatedQuery[0], separatedQuery[1], separatedQuery[2], foodScore[0]]
        var tempSet = Set(Array(0..<informations.count))
        for idx in 0..<4 {
            if condition[idx] == "-" {
                continue
            }
            tempSet.formIntersection(superSets[idx][condition[idx]]!)
        }
        let a = tempSet.filter {
            Int(informations[$0][4])! >= Int(foodScore[1])!
        }.count
        answer.append(a)
    }
    return answer
}