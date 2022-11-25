//  프로그래머스 - 내적
//  https://school.programmers.co.kr/learn/courses/30/lessons/70128
//  Created by 홍은표 on 2022/11/25.

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
}
