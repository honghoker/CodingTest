//  프로그래머스 - 위장
//  https://school.programmers.co.kr/learn/courses/30/lessons/42578
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var map = [String: [String]]()
    for cloth in clothes {
        map[cloth[1], default: []].append(cloth[0])
    }
    
    for key in map.keys {
        answer *= (map[key]!.count + 1)
    }
    
    return answer - 1
}
