//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/08.
//

import Foundation

// 2 x n
// 1 x 2 가로 2칸, 세로 1칸, 위 아래 2개 놓으면 2x2
// 2 x 1 가로 1칸, 세로 2칸, 좌 우 2개 놓으면 2x2
// 피보나치랑 같음

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)

dp[0] = 1
dp[1] = 1
for i in 2..<n+1 {
    dp[i] = (dp[i-1] + dp[i-2]) % 10007
}
print(dp[n])
