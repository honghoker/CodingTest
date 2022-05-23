//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/24.
//

import Foundation

let n = Int(String(readLine()!))!
var p = [Int]()
var dp = Array(repeating: 0, count: 10001)
p.append(0)
for _ in 1...n {
    p.append(Int(String(readLine()!))!)
}

dp[1] = p[1]
if n >= 2 {
    dp[2] = p[1] + p[2]
}

if n >= 3 {
    for i in 3...n {
        dp[i] = max(p[i] + dp[i-2], p[i] + p[i-1] + dp[i-3], dp[i-1])
    }
}

print(dp[n])

//        // 바로 전 포도주를 마시지 않았을 때
//        p[i] + dp[i-2] // 더있나?
//        // 바로 전 포도주를 마셨을 때
//        p[i] + p[i-1] + dp[i-3]
//        //  현재 포도주를 안마셨을 때, 바로 전 연속 2개의 선택이 더 큰 경우
//        dp[i-1]
