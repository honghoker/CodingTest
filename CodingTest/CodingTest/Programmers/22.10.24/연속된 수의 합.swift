//  프로그래머스 - 연속된 수의 합
//  https://school.programmers.co.kr/learn/courses/30/lessons/120923
//  Created by 홍은표 on 2022/10/23.

import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    let sum = num * (num + 1) / 2
    let offset = (total - sum) / num

    var answer = [Int]()
    for i in 1...num {
        answer.append(i+offset)
    }
    
    return answer
}
