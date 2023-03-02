//  프로그래머스 - 연속 펄스 부분 수열의 합
//  https://school.programmers.co.kr/learn/courses/30/lessons/161988
//  Created by 홍은표 on 2023/03/03.

import Foundation

func solution(_ sequence: [Int]) -> Int {
    var dp = [[sequence[0]], [sequence[0] * -1]]
    var mul = -1
    for i in 0..<sequence.count {
        dp[0].append(max(dp[0].last! + (sequence[i] * mul), sequence[i] * mul))
        mul *= -1
        dp[1].append(max(dp[1].last! + (sequence[i] * mul), sequence[i] * mul))
    }
    return max(dp[0].max()!, dp[1].max()!)
}
