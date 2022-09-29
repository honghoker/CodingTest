//  프로그래머스 - 괄호 회전하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/76502#
//  Created by 홍은표 on 2022/09/29.


import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var s = s.map { String($0) }
    
    func calc(_ str: [String]) {
        var stack = [String]()
        for ch in str {
            if stack.isEmpty {
                if ch == ")" || ch == "}" || ch == "]" { return }
            }
            if ch == "(" || ch == "{" || ch == "[" {
                stack.append(ch)
            } else {
                let last = stack.last!
                if ch == ")" && last == "(" { stack.removeLast() }
                else if ch == "}" && last == "{" { stack.removeLast() }
                else if ch == "]" && last == "[" { stack.removeLast() }
                else { return }
            }
        }
        if stack.isEmpty { answer += 1 }
    }
    
    calc(s)
    for _ in 0..<s.count - 1 {
        let ch = s.removeFirst()
        s.append(ch)
        calc(s)
    }
    
    return answer
}
