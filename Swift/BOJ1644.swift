//
//  main.swift
//  BOJalgorithm
//
//  Created by KellyChui on 2023/02/26.
//

import Foundation

func findPrimes(n: Int) -> [Int] {
    if n == 1 {
        return []
    }
    var isPrime = [Bool](repeating: true, count: n + 1)
    var primes: [Int] = []
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 2...n {
        if isPrime[i] {
            var multiple: Int = 2
            while multiple * i <= n {
                isPrime[multiple * i] = false
                multiple += 1
            }
        }
    }
    
    for i in 0...n {
        if isPrime[i] {
            primes.append(i)
        }
    }
    return primes
}

let n = Int(readLine()!)!
var primes = findPrimes(n: n)
var startPtr: Int = 0
var endPtr: Int = 0
var sum: Int = 2
var count: Int = 0

if n == 1 {
    print(0)
} else {
    while true {
        if sum > n {
            sum -= primes[startPtr]
            startPtr += 1
        } else {
            if sum == n {
                count += 1
            }
            endPtr += 1
            if endPtr >= primes.count {
                break
            }
            sum += primes[endPtr]
        }
    }
    print(count)
}
