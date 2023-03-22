//  프로그래머스 - 가장 큰 정사각형 찾기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12905
//  Created by 홍은표 on 2023/03/22.

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer = board[0][0], dp = board
    for i in 1..<board.count {
        for j in 1..<board[i].count where board[i][j] == 1 {
            dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
            answer = max(answer, dp[i][j])
        }
    }
    return answer * answer
}
