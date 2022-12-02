//  프로그래머스 - 문자열 나누기
//  https://school.programmers.co.kr/learn/courses/30/lessons/140108
//  Created by 홍은표 on 2022/12/02.

import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var map = [Character: Int]()
    var x: Character = "N"
    s.forEach {
        if map.isEmpty {
            x = $0; map[x] = 1
        } else {
            map[$0 == x ? $0 : "N", default: 0] += 1
            if x != $0 && map[x]! == map["N"]! {
                map.removeAll()
                answer += 1
            }
        }
    }
    return map.isEmpty ? answer : answer + 1
}
