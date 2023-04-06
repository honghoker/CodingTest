//  프로그래머스 - 연속된 부분 수열의 합
//  https://school.programmers.co.kr/learn/courses/30/lessons/178870
//  Created by 홍은표 on 2023/04/06.

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var left = 0, right = 0
    var sum = sequence[0]
    var answer = (0, Int(10e5))
    while left <= right {
        if sum < k && right < sequence.count - 1 {
            right += 1
            sum += sequence[right]
        } else {
            if sum == k {
                if left == right { return [left, right] }
                else if abs(answer.1 - answer.0) > abs(right - left) { answer = (left, right) }
            }
            sum -= sequence[left]
            left += 1
        }
    }
    return [answer.0, answer.1]
}
