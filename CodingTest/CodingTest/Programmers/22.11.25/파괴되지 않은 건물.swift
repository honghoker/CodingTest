//  프로그래머스 - 파괴되지 않은 건물
//  https://school.programmers.co.kr/learn/courses/30/lessons/92344
//  Created by 홍은표 on 2022/11/25.

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let N = board.count
    let M = board[0].count
    var arr = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
    
    skill.forEach {
        var (type, r1, c1, r2, c2, degree) = ($0[0], $0[1], $0[2], $0[3]+1, $0[4]+1, $0[5])
        if type == 1 { degree = degree * -1 }
        arr[r1][c1] += degree
        arr[r2][c2] += degree
        arr[r1][c2] -= degree
        arr[r2][c1] -= degree
    }
    
    for i in 0..<arr.count {
        for j in 1..<arr.count {
            arr[j][i] += arr[j-1][i]
        }
    }
    
    var answer = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if j != 0 {
                arr[i][j] += arr[i][j-1]
            }
            if arr[i][j] + board[i][j] > 0 {
                answer += 1
            }
        }
    }
       
    return answer
}
