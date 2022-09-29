//  프로그래머스 - 최솟값 만들기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12941
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var answer = 0
    let A = A.sorted()
    let B = B.sorted(by: >)

    for i in 0..<A.count {
        answer += A[i] * B[i]
    }
    
    return answer
}
