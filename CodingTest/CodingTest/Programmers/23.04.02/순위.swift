//  프로그래머스 - 순위
//  https://school.programmers.co.kr/learn/courses/30/lessons/49191
//  Created by 홍은표 on 2023/04/02.

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var map = Array(repeating: Array(repeating: 9, count: n), count: n)
    (0..<n).forEach { map[$0][$0] = 0 }
    results.forEach {
        map[$0[0]-1][$0[1]-1] = 1
        map[$0[1]-1][$0[0]-1] = -1
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if map[i][k] == 1 && map[k][j] == 1 {
                    map[i][j] = 1; map[j][i] = -1
                }
            }
        }
    }
    
    return map.filter { !$0.contains(9) }.count
}
