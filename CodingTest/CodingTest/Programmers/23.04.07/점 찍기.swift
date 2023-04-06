//  프로그래머스 - 점 찍기
//  https://school.programmers.co.kr/learn/courses/30/lessons/140107
//  Created by 홍은표 on 2023/04/07.

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0

    for x in stride(from: 0, through: d, by: k) {
        let maxY = Int(sqrt(Double(d * d - x * x)))
        answer += Int64(ceil(Double(maxY) / Double(k)) + (maxY % k == 0 ? 1 : 0))
    }

    return answer
}
