//  프로그래머스 - 과일 장수
//  https://school.programmers.co.kr/learn/courses/30/lessons/135808
//  Created by 홍은표 on 2022/11/11.

import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var answer = 0
    var score = score.sorted(by: <)
    var idx = score.count - 1
    while idx >= m - 1 {
        answer += score[idx-m+1] * m
        idx -= m
    }
    return answer
}
