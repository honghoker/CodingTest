//  프로그래머스 - 스티커 모으기(2)
//  https://school.programmers.co.kr/learn/courses/30/lessons/12971
//  Created by 홍은표 on 2023/03/20.

import Foundation

func solution(_ sticker:[Int]) -> Int{
    if sticker.count == 1 { return sticker[0] }
    if sticker.count == 2 { return sticker.max()! }
    
    var dp = [[sticker[0], sticker[0]], [0, sticker[1]]]

    for i in 2..<sticker.count - 1 {
        dp[0].append(max(dp[0][i-2] + sticker[i], dp[0][i-1]))
    }
    
    for i in 2..<sticker.count {
        dp[1].append(max(dp[1][i-2] + sticker[i], dp[1][i-1]))
    }
    
    return max(dp[0].last!, dp[1].last!)
}
