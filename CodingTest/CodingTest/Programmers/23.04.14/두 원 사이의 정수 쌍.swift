//  프로그래머스 - 두 원 사이의 정수 쌍
//  https://school.programmers.co.kr/learn/courses/30/lessons/181187
//  Created by 홍은표 on 2023/04/14.

import Foundation

func solution(_ r1: Int, _ r2: Int) -> Int64 {
    var answer = 0
    for i in 1...r1 {
        answer += Int(floor(sqrt(Double(r2 * r2 - i * i)))) - Int(ceil(sqrt(Double(r1 * r1 - i * i)))) + 1
    }
    for i in r1+1...r2 {
        answer += Int(floor(sqrt(Double(r2 * r2 - i * i)))) + 1
    }
    return Int64(answer * 4)
}

print(solution(2, 3))
