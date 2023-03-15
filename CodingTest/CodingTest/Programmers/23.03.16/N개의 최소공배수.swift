//  프로그래머스 - N개의 최소공배수
//  https://school.programmers.co.kr/learn/courses/30/lessons/12953
//  Created by 홍은표 on 2023/03/16.

import Foundation

func solution(_ arr: [Int]) -> Int {
    return arr.reduce(1, { $0.lcm($1) })
}

extension Int {
    func gcd(_ other: Int) -> Int {
        return other == 0 ? self : other.gcd(self % other)
    }
    
    func lcm(_ other: Int) -> Int {
        return self * other / self.gcd(other)
    }
}
