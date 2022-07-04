//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/09.
//

import Foundation

let T = Int(readLine()!)!

var dp = Array(repeating: 0, count: 101)
dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2
dp[5] = 2
dp[6] = 3

for i in 7...100{
    dp[i] = dp[i-1] + dp[i-5]
}

for _ in 0..<T {
    print(dp[Int(readLine()!)!])
}
