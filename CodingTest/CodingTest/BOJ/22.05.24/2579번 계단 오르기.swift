//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/24.
//

// 2579 계단 오르기

import Foundation

let n = Int(readLine()!)!
var stair = [Int]()
var dp = Array(repeating: 0, count: n)

for _ in 0..<n {
    stair.append(Int(readLine()!)!)
}

if n == 1 { // 계단 한개
    print(stair[0])
} else if n == 2 { // 계단 두개
    print(stair[0] + stair[1])
} else if n == 3 { // 계단 세개
    print(max(stair[0], stair[1]) + stair[2])
} else {
    dp[0] = stair[0]
    dp[1] = stair[0] + stair[1]
    dp[2] = max(stair[0], stair[1]) + stair[2]
    for i in 3..<n {
        dp[i] = max(stair[i] + dp[i - 2], stair[i] + stair[i-1] + dp[i-3])
    }
    print(dp[n-1])
}




