//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/29.
//

import Foundation

// 1 1 = 1
// 2 1+1, 2 = 2
// 3 1+1+1, 2+1, 1+2, 3 = 4
// 4 1+1+1+1, 1+1+2, 1+2+1, 2+1+1, 2+2, 1+3, 3+1 = 7
// 5 1+1+1+1+1, 1+1+1+2, 1+1+2+1, 1+2+1+1, 2+1+1+1, 1+2+2, 2+1+2, 2+2+1, 1+1+3, 1+3+1, 3+1+1, 2+3, 3+2 // 13

let T = Int(readLine()!)!
var dp = Array(repeating: 0, count: 11+1)

dp[1] = 1
dp[2] = 2
dp[3] = 4
dp[4] = 7
dp[5] = 13

for i in 6...11 {
    dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
}

for _ in 0..<T {
    let n = Int(readLine()!)!
    print(dp[n])
}

