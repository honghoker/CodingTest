//  프로그래머스 - 기사단원의 무기
//  https://school.programmers.co.kr/learn/courses/30/lessons/136798
//  Created by 홍은표 on 2022/11/18.

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var map = Array(repeating: Set<Int>(), count: number + 1)
    var answer = 0
    
    for i in 1...number {
        for j in 1...number {
            if i * j > number { break }
            map[i*j].insert(i)
            map[i*j].insert(j)
        }
    }
    for i in 1...number {
        let count = map[i].count
        answer += (count > limit) ? power : count
    }
    return answer
}
