//  프로그래머스 - 보석 쇼핑
//  https://school.programmers.co.kr/learn/courses/30/lessons/67258
//  Created by 홍은표 on 2022/11/24.

import Foundation

func solution(_ gems:[String]) -> [Int] {
    let length: Int = Set(gems).count
    var map = [String: Int]()
    var left = 0, right = 0
    var answer = [(Int, Int)]()
    
    while right < gems.count {
        map[gems[right], default: 0] += 1
        right += 1
        while map.count == length {
            map[gems[left]]! -= 1
            if map[gems[left]]! == 0 {
                map[gems[left]] = nil
            }
            left += 1
            answer.append((left, right))
        }
    }
    let result = answer.sorted { $0.1 - $0.0 == $1.1 - $1.0 ? $0.0 < $1.0 : $0.1 - $0.0 < $1.1 - $1.0 }
    return [result[0].0, result[0].1]
}
