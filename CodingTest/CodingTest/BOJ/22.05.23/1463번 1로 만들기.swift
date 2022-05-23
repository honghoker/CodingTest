//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/23.
//

//1 -> 0
//2 -> 2/2 = 1 -> 1
//3 -> 3/3 = 1 -> 1
//4 -> 4/2 = 2/2 = 1 -> 2
//5 -> 5-1 = 4/2 = 2/2 = 1 -> 1

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)

for i in 2..<n+1 {
    dp[i] = dp[i-1] + 1
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    }
}

print(dp[n])
