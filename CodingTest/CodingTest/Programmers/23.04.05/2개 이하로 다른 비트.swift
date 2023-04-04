//  프로그래머스 - 2개 이하로 다른 비트
//  https://school.programmers.co.kr/learn/courses/30/lessons/77885
//  Created by 홍은표 on 2023/04/05.

import Foundation

func solution(_ numbers: [Int64]) -> [Int64] {
    return numbers.map {
        if $0 % 2 == 0 { return $0 + 1 }
        else {
            var i: Int64 = 1
            while $0 & i != 0 { i <<= 1 }
            return $0 + i / 2
        }
    }
}
