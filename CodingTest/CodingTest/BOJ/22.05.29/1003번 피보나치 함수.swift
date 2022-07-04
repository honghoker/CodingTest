//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/28.
//

import Foundation

//     0 1
// 6 : 5 8
// 5 : 3 5
// 4 : 2 3
// 3 : 1 2
// 2 : 1 1
// 1 : 0 1
// 0 : 1 0


let T = Int(readLine()!)!

struct cost {
    let zero: Int
    let one: Int
}

for _ in 0..<T {
    let N = Int(readLine()!)!
    
    var dp = Array(repeating: cost(zero: 0, one: 0), count: N+1)
    
    if N == 0 {
        print("1 0")
    } else if N == 1{
        print("0 1")
    } else if N == 2{
        print("1 1")
    } else {
        dp[0] = cost(zero: 1, one: 0)
        dp[1] = cost(zero: 0, one: 1)
        dp[2] = cost(zero: 1, one: 1)
        for i in 3...N {
            dp[i] = cost(zero: dp[i-1].zero + dp[i-2].zero, one: dp[i-1].one + dp[i-2].one)
        }
        print("\(dp[N].zero) \(dp[N].one)")
    }
}
