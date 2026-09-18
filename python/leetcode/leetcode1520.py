# https://leetcode.com/problems/maximum-number-of-non-overlapping-substrings

class Solution:
    def maxNumOfSubstrings(self, s: str) -> list[str]:
        charRanges = {}
        for idx in range(len(s)):
            if s[idx] not in charRanges:
                charRanges[s[idx]] = (idx, idx)
            start = charRanges[s[idx]][0]
            charRanges[s[idx]] = (start, idx)
        candidates = []
        for char, (start, end) in charRanges.items():
            i = start
            curStart, curEnd = start, end
            valid = True
            while i <= curEnd:
                c = s[i]
                cStart, cEnd = charRanges[c]
                if cStart < curStart:
                    valid = False
                    break
                if cEnd > curEnd:
                    curEnd = cEnd
                i += 1
            if valid:
                candidates.append((curStart, curEnd))
        candidates.sort(key=lambda x: x[1])
        result = []
        lastEnd = -1

        for start, end in candidates:
            if start > lastEnd:
                result.append(s[start:end + 1])
                lastEnd = end

        return result
