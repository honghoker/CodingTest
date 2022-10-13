//  프로그래머스 - 연속 부분 수열 합의 개수
//  https://school.programmers.co.kr/learn/courses/30/lessons/131701
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ elements:[Int]) -> Int {
    var answer = Set<Int>()
    let length = elements.count
    func dfs(_ now: Int, _ num: Int, _ count: Int) {
        answer.insert(num)
        if length == count { return }

        dfs((now + 1) % length, num + elements[now % length], count + 1)
    }

    for i in 0..<length {
        dfs((i + 1) % length, elements[i], 1)
    }

    return answer.count
}
