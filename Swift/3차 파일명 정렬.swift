func solution(_ files:[String]) -> [String] {
    
    func fileSort(_ string1: String, _ string2: String) -> Bool {
        var arrayStr1 = Array(string1.lowercased())
        var arrayStr2 = Array(string2.lowercased())
        
        var (head1, number1) = ("", "")
        var (head2, number2) = ("", "")
        
        var isN = false
        var hPtr = 0
        for idx in 0..<arrayStr1.count {
            if arrayStr1[idx].isNumber && !isN {
                head1 = Array(arrayStr1[0..<idx]).map { String($0) }.joined()
                isN = true
                hPtr = idx
            }
            
            if !arrayStr1[idx].isNumber && isN {
                number1 = Array(arrayStr1[hPtr..<idx]).map { String($0) }.joined()
                break
            }
            
            if idx == arrayStr1.count - 1 && isN {
                number1 = Array(arrayStr1[hPtr...idx]).map { String($0) }.joined()
            }
        }
        
        isN = false
        hPtr = 0
        for idx in 0..<arrayStr2.count {
            if arrayStr2[idx].isNumber && !isN {
                head2 = Array(arrayStr2[0..<idx]).map { String($0) }.joined()
                isN = true
                hPtr = idx
            }
            
            if !arrayStr2[idx].isNumber && isN {
                number2 = Array(arrayStr2[hPtr..<idx]).map { String($0) }.joined()
                break
            }
            
            if idx == arrayStr2.count - 1 && isN {
                number2 = Array(arrayStr2[hPtr...idx]).map { String($0) }.joined()
            }
        }
        
        if head1 > head2 {
            return false
        } else if head1 < head2 {
            return true
        } else if head1 == head2 {
            if Int(number1)! < Int(number2)! {
                return true
            } else {
                return false
            }
        }
        return true
    }
    
    return files.sorted(by: fileSort)
}

