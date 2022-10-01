//  프로그래머스 - 올바른 괄호
//  https://school.programmers.co.kr/learn/courses/30/lessons/12909
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ s:String) -> Bool {
    var count = 0
    for ch in s {
        if ch == "(" { count += 1 }
        else { count -= 1 }
        if count < 0 { break }
    }
    
    return count == 0 ? true : false
}
