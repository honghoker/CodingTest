//  프로그래머스 - 영어 끝말잇기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12981
//  Created by 홍은표 on 2022/10/02.

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var records = Set<String>()
    var beforeWord: String? = nil
    
    for word in words {
        if records.contains(word) {
            return [(records.count % n) + 1, (records.count / n) + 1]
        } else {
            if let before = beforeWord?.last, let current = word.first {
                if before != current {
                    return [(records.count % n) + 1, (records.count / n) + 1]
                }
            }
        }
        records.insert(word)
        beforeWord = word
    }
    return [0, 0]
}
