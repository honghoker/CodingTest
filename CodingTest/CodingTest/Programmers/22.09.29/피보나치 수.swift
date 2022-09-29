//  프로그래머스 - 피보나치 수
//  https://school.programmers.co.kr/learn/courses/30/lessons/12945#
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+1)
    dp[0] = 0
    dp[1] = 1
    
    for i in 2...n {
        dp[i] = (dp[i-1] + dp[i-2]) % 1234567
    }
    
    return dp[n]
}
