//  프로그래머스 - 요격 시스템
//  https://school.programmers.co.kr/learn/courses/30/lessons/181188
//  Created by 홍은표 on 2023/04/14.

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets: [[Double]] = targets
        .map { [Double($0[0]) + 0.1, Double($0[1])] }
        .sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }
    
    var answer = 1, end = targets[0][1]
    print(answer)
    for i in 1..<targets.count {
        targets[i][0]
    }
    return answer
}
