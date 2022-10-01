//  프로그래머스 - n진수 게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/17687
//  Created by 홍은표 on 2022/10/01.

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numbers = [String]()
    
    for i in 0..<m*t {
        numbers += String(i, radix: n).map { String($0) }
        if numbers.count >= t*m { break }
    }
    
    var idx = p - 1
    var count = 0
    var answer = ""
    while count < t {
        answer.append(numbers[idx].uppercased())
        idx += m
        count += 1
    }
    
    return answer
}
