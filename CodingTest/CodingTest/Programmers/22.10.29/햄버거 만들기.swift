//  프로그래머스 - 햄버거 만들기
//  https://school.programmers.co.kr/learn/courses/30/lessons/133502
//  Created by 홍은표 on 2022/10/29.

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int]()
    var answer = 0
    var hamburger = [1, 2, 3, 1]
    ingredient.forEach {
        stack.append($0)
        
        if $0 == hamburger.last {
            if stack.count >= hamburger.count {
                var isHamburger = true
                for i in 0..<hamburger.count {
                    if stack[stack.count - 1 - i] != hamburger[hamburger.count - 1 - i] {
                        isHamburger = false; break
                    }
                }
                if isHamburger {
                    for _ in 0..<hamburger.count { stack.removeLast() }
                    answer += 1
                }
            }
        }
    }
    return answer
}
