//  프로그래머스 - 시소 짝꿍
//  https://school.programmers.co.kr/learn/courses/30/lessons/152996
//  Created by 홍은표 on 2023/02/23.

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var map = [Double: Int64]()
    var answer: Int64 = 0
    
    for weight in weights {
        let weight = Double(weight)
        answer +=
            map[weight, default: 0] +
            map[weight * 2, default: 0] +
            map[weight / 2, default: 0] +
            map[weight * 3 / 2, default: 0] +
            map[weight * 2 / 3, default: 0] +
            map[weight * 4 / 3, default: 0] +
            map[weight * 3 / 4, default: 0]
        map[weight, default: 0] += 1
    }
    
    return answer
}
