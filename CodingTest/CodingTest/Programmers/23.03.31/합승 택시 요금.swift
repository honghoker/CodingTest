//  프로그래머스 - 합승 택시 요금
//  https://school.programmers.co.kr/learn/courses/30/lessons/72413
//  Created by 홍은표 on 2023/03/31.

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var map = (0...n).map { i in (0...n).map { j in i == j ? 0 : 98765432 } }
    fares.forEach {
        map[$0[0]][$0[1]] = $0[2]
        map[$0[1]][$0[0]] = $0[2]
    }
    
    for k in 1...n {
        for u in 1...n {
            for v in 1...n {
                map[u][v] = min(map[u][v], map[u][k] + map[k][v])
            }
        }
    }
    
    return (1...n).map { k in map[s][k] + map[k][a] + map[k][b] }.min()!
}
