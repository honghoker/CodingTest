//  프로그래머스 - 가장 가까운 같은 글자
//  https://school.programmers.co.kr/learn/courses/30/lessons/142086
//  Created by 홍은표 on 2022/12/09.

import Foundation

func solution(_ s:String) -> [Int] {
    var map = [String: Int]()
    let s = s.map { String($0) }
    var answer = [Int]()
    for i in 0..<s.count {
        if map[s[i]] == nil {
            answer.append(-1)
        } else {
            answer.append(i - map[s[i]]!)
        }
        map[s[i]] = i
    }
    return answer
}
