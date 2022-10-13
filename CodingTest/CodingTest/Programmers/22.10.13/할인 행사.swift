//  프로그래머스 - 할인 행사
//  https://school.programmers.co.kr/learn/courses/30/lessons/131127
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    var map = [String: Int]()
    
    for i in 0..<want.count {
        map[want[i]] = number[i]
    }

    for i in 0...discount.count - 10 {
        if map[discount[i]] == nil { continue }
        var tempMap = map
        for j in i...i+9 {
            if tempMap[discount[j]] == nil { continue }
            tempMap[discount[j]]! -= 1
            if tempMap[discount[j]] == 0 {
                tempMap[discount[j]] = nil
            }
        }
        if tempMap.count == 0 { answer += 1 }
    }
    
    return answer
}
