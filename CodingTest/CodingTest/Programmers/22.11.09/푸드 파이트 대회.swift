//  프로그래머스 - 푸드 파이트 대회
//  https://school.programmers.co.kr/learn/courses/30/lessons/134240
//  Created by 홍은표 on 2022/11/09.

import Foundation

func solution(_ food:[Int]) -> String {
    var answer = ""
    
    for i in 1..<food.count {
        answer += String(repeating: "\(i)", count: (food[i] / 2))
    }
    
    return answer + "0" + answer.reversed()
}
