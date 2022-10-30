//  프로그래머스 - 옹알이 (2)
//  https://school.programmers.co.kr/learn/courses/30/lessons/133499
//  Created by 홍은표 on 2022/10/30.

import Foundation

func solution(_ babbling:[String]) -> Int {
    var babs: [Character: [String]] = ["a": ["a", "y", "a"], "y": ["y", "e"], "w": ["w", "o", "o"], "m": ["m", "a"]]
    var answer = 0
    
    for babble in babbling {
        var babble = Array(babble)
        var idx = 0
        var current: String = ""
        while idx < babble.count {
            guard let bab = babs[babble[idx]] else { break }
            if current != bab[0] && babble.count >= bab.count {
                if String(babble[idx...(idx+bab.count-1)]) == bab.joined() {
                    current = bab[0]
                    idx += bab.count
                } else {
                    break
                }
            } else {
                break
            }
        }
        if idx == babble.count { answer += 1 }
    }
    
    return answer
}
