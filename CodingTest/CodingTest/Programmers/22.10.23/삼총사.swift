//  프로그래머스 - 삼총사
//  https://school.programmers.co.kr/learn/courses/30/lessons/131705
//  Created by 홍은표 on 2022/10/23.

import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    func dfs(_ now: Int, _ sum: Int, _ count: Int) {
        if count == 3 {
            if sum == 0 { answer += 1 }
            return
        }
        for i in now..<number.count {
            dfs(i+1, sum + number[i], count + 1)
        }
    }
    dfs(0, 0, 0)
    return answer
}
