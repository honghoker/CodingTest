//  프로그래머스 - 피로도
//  https://school.programmers.co.kr/learn/courses/30/lessons/87946
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let dungeons = dungeons.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0] }
    var answer = 0
    var length = dungeons.count
    var visit = Array(repeating: false, count: length)

    func dfs(_ k: Int, _ count: Int) {
        for i in 0..<length {
            if !visit[i] && k >= dungeons[i][0] {
                visit[i] = true
                answer = max(answer, count + 1)
                dfs(k - dungeons[i][1], count + 1)
                visit[i] = false
            }
        }
    }
    
    for i in 0..<length {
        if k >= dungeons[i][0] {
            visit[i] = true
            dfs(k - dungeons[i][1], 1)
            visit[i] = false
        }
    }
    
    return answer
}
