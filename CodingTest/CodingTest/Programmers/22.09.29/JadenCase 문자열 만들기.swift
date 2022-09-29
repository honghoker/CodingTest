//  프로그래머스 - JadenCase 문자열 만들기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12939
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ s:String) -> String {
    var answer = ""
    var first = true
    
    for ch in s {
        if ch == " " { answer.append(ch); first = true; continue }
        if first == true { answer.append(ch.uppercased()); first = false }
        else { answer.append(ch.lowercased()) }
    }
    
    return answer
}
