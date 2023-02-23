//  프로그래머스 - 대충 만든 자판
//  https://school.programmers.co.kr/learn/courses/30/lessons/160586
//  Created by 홍은표 on 2023/02/23.

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var map = [Character: Int]()
    var answer = [Int]()
    
    for key in keymap {
        key.enumerated().forEach {
            if map[$0.element, default: Int.max] > $0.offset {
                map[$0.element] = $0.offset + 1
            }
        }
    }
    
    targets.forEach {
        var sum = 0
        for target in $0 {
            guard let key = map[target] else { sum = -1; break }
            sum += key
        }
        answer.append(sum)
    }
    
    return answer
}
