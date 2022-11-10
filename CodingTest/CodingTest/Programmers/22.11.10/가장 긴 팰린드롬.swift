//  프로그래머스 - 가장 긴 팰린드롬
//  https://school.programmers.co.kr/learn/courses/30/lessons/12904
//  Created by 홍은표 on 2022/11/10.

import Foundation

func solution(_ s:String) -> Int {
    let s = s.map { String($0) }
    var answer = 0
    
    for i in 0..<s.count {
        for j in stride(from: s.count - i, to: answer, by: -1) {
            var left = i
            var right = i + j - 1
            while left <= right, s[left] == s[right] {
                left += 1; right -= 1
            }
            if left > right { answer = max(answer, j) }
        }
    }
    
    return answer
}
