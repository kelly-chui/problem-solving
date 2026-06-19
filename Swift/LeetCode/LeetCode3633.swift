// https://leetcode.com/problems/earliest-finish-time-for-land-and-water-rides-i

class Solution {
    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {
        var answer = Int.max
        for (landStart, landDur) in zip(landStartTime, landDuration) {
            for (waterStart, waterDur) in zip(waterStartTime, waterDuration) {
                let landFinish = landStart + landDur
                let waterBeginAfterLand = max(landFinish, waterStart)
                let finishLandFirst = waterBeginAfterLand + waterDur
                let waterFinish = waterStart + waterDur
                let landBeginAfterWater = max(waterFinish, landStart)
                let finishWaterFirst = landBeginAfterWater + landDur
                answer = min(answer, finishLandFirst, finishWaterFirst)
            }
        }
        return answer
    }
}
