//  프로그래머스 - 혼자서 하는 틱택토
//  https://school.programmers.co.kr/learn/courses/30/lessons/160585
//  Created by 홍은표 on 2023/02/23.

import Foundation

func solution(_ board:[String]) -> Int {
    var total = 0
    // 가로, 세로, 대각선
    var row = [0, 0, 0], col = [0, 0, 0], diagonal = [0, 0]
    
    board.enumerated().forEach { i, board in
        board.enumerated().forEach { j, ch in
            var d = 0
            if ch == "O" { d = 1 }
            if ch == "X" { d = -1 }
            total += d; row[i] += d; col[j] += d
            if i == j { diagonal[0] += d }
            if i == 2 - j { diagonal[1] += d }
        }
    }

    // 절대값 차이가 2이상 나면 나올 수 없는 상황
    if total < 0 || total > 1 { return 0 }
    
    // 같은 양이라면 흰돌이 승리할 수 없다.
    if total == 0 {
        for data in [row, col, diagonal] {
            if !data.filter { $0 == 3 }.isEmpty { return 0 }
        }
    }
    
    // 흰돌이 한개 더 뒀을 때 검은돌이 승리할 수 없다.
    if total == 1 {
        for data in [row, col, diagonal] {
            if !data.filter { $0 == -3 }.isEmpty { return 0 }
        }
    }

    return 1
}
