//  프로그래머스 - 땅따먹기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12913
//  Created by 홍은표 on 2023/03/16.

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    dp[0] = land[0]
    
    for i in 1..<land.count {
        dp[i][0] += land[i][0] + max(dp[i-1][1], dp[i-1][2], dp[i-1][3])
        dp[i][1] += land[i][1] + max(dp[i-1][0], dp[i-1][2], dp[i-1][3])
        dp[i][2] += land[i][2] + max(dp[i-1][0], dp[i-1][1], dp[i-1][3])
        dp[i][3] += land[i][3] + max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
    }
    
    return dp[land.count-1].max()!
}
