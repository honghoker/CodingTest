//  프로그래머스 - 하노이의 탑
//  https://school.programmers.co.kr/learn/courses/30/lessons/12946
//  Created by 홍은표 on 2023/03/19.

import Foundation

func solution(_ n:Int) -> [[Int]] {
    var answer = [[Int]]()
    func dfs(_ n: Int, _ start: Int, _ mid: Int, _ to: Int) {
        if n == 1 { answer.append([start, to]); return }
        dfs(n-1, start, to, mid)
        answer.append([start, to])
        dfs(n-1, mid, start, to)
    }
    dfs(n, 1, 2, 3)
    return answer
}
