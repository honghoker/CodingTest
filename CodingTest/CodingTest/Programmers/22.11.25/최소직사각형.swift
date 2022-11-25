//  프로그래머스 - 최소직사각형
//  https://school.programmers.co.kr/learn/courses/30/lessons/86491
//  Created by 홍은표 on 2022/11/25.

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var w = [Int](), h = [Int]()
    sizes.forEach {
        w.append(max($0[0], $0[1]))
        h.append(min($0[0], $0[1]))
    }
    return w.max()! * h.max()!
}
