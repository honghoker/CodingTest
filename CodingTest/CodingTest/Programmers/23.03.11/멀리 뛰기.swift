//  프로그래머스 - 멀리 뛰기.swift
//  https://school.programmers.co.kr/learn/courses/30/lessons/12914
//  Created by 홍은표 on 2023/03/11.

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: max(3, n + 1))
    dp[1] = 1; dp[2] = 2
    for i in stride(from: 3, through: n, by: 1) {
        dp[i] = (dp[i-1] + dp[i-2]) % 1234567
    }
    
    return dp[n]
}
