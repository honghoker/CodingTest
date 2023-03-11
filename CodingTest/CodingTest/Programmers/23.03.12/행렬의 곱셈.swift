//  프로그래머스 - 행렬의 곱셈
//  https://school.programmers.co.kr/learn/courses/30/lessons/12949
//  Created by 홍은표 on 2023/03/12.

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let row = arr2[0].count, col = arr1.count
    var answer = Array(repeating: Array(repeating: 0, count: row), count: col)

    for i in 0..<col {
        for j in 0..<row {
            for k in 0..<arr1[0].count {
                answer[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    
    return answer
}
