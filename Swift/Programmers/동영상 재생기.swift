import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    typealias MST = (m: Int, s: Int)
    let videoLen = video_len.split(separator: ":").compactMap { Int($0) }
    let current = pos.split(separator: ":").compactMap { Int($0) }
    let opStart = op_start.split(separator: ":").compactMap { Int($0) }
    let opEnd = op_end.split(separator: ":").compactMap { Int($0) }
    let opStartMST: MST = (m: opStart[0], s: opStart[1])
    let opEndMST: MST = (m: opEnd[0], s: opEnd[1])
    let (vm, vs) = (videoLen[0], videoLen[1])
    var pm = current[0]
    var ps = current[1]

    func updateTime() {
        if ps >= 60 {
            ps -= 60
            pm += 1
        } else if ps < 0 {
            ps += 60
            pm -= 1
        }

        if pm < 0 {
            pm = 0
            ps = 0
        } else if pm > vm {
            pm = vm
            ps = vs
        } else if pm == vm && ps > vs {
            ps = vs
        }
    }

    func isOp() -> Bool {
        guard pm >= opStartMST.m, pm <= opEndMST.m else { return false }
        if pm == opStartMST.m && ps < opStartMST.s { return false }
        if pm == opEndMST.m && ps > opEndMST.s { return false }
        return true
    }

    func prev() {
        ps -= 10
        updateTime()
    }

    func next() {
        ps += 10
        updateTime()
    }

    func skipOp() {
        if isOp() {
            pm = opEndMST.m
            ps = opEndMST.s
        }
    }

    skipOp()
    for command in commands {
        switch command {
            case "prev": prev()
            case "next": next()
            default: break
        }
        skipOp()
    }

    let formattedM = String(format: "%02d", pm)
    let formattedS = String(format: "%02d", ps)

    return formattedM + ":" + formattedS
}
