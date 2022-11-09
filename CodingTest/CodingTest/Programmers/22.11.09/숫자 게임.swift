//  프로그래머스 - 숫자게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/12987
//  Created by 홍은표 on 2022/11/09.

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted()
    let b = b.sorted()
    var idx = 0
    var answer = 0
    for b in b {
        if b > a[idx] {
            answer += 1
            idx += 1
        }
    }
    return answer
}
