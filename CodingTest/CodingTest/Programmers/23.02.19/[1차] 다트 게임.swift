//  프로그래머스 - [1차] 다트 게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/17682#
//  Created by 홍은표 on 2023/02/19.

import Foundation

func solution(_ dartResult:String) -> Int {
    let bonus = ["S": 1.0, "D": 2.0, "T": 3.0]
    let options = ["*": 2, "#": -1]
    var stack = [Int]()
    var number = ""
    
    dartResult.forEach {
        if $0.isNumber {
            number.append($0)
        } else if let score = bonus[String($0)] {
            stack.append(Int(pow(Double(number)!, score)))
            number = ""
        } else if let option = options[String($0)] {
            let num = stack.removeLast()
            if option == 2 {
                if let prev = stack.popLast() {
                    stack.append(prev * option)
                }
            }
            stack.append(num * option)
        }
    }
    return stack.reduce(0, +)
}
