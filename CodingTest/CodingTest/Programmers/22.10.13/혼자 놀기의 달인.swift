//  프로그래머스 - 혼자 놀기의 달인
//  https://school.programmers.co.kr/learn/courses/30/lessons/131130
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ cards:[Int]) -> Int {
    var answer = [Int]()
    var visit = Array(repeating: false, count: cards.count)
    
    for i in 0..<cards.count {
        if visit[i] { continue }
        var next = i
        var arr = [Int]()
        while !visit[next] {
            visit[next] = true
            arr.append(next)
            next = cards[next] - 1
        }
        answer.append(arr.count)
    }
    
    answer = answer.sorted(by: >)
    return answer.count == 1 ? 0 : answer[0] * answer[1]
}
