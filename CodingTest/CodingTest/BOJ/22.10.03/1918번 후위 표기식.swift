//  백준 - 후위 표기식
//  https://www.acmicpc.net/problem/1918
//  Created by 홍은표 on 2022/10/03.

import Foundation

var s = readLine()!
var stack = [Character]()
var answer = ""

func getPriority(_ op: Character) -> Int {
    switch op {
        case "+", "-": return 1
        case "*", "/": return 2
        default: return 0
    }
}

for ch in s {
    if ch.isLetter {
        answer.append(ch)
        continue
    }
    
    if ch == "(" {
        stack.append(ch)
    } else if ch == ")" {
        while true {
            let data = stack.removeLast()
            if data == "(" { break }
            answer.append(data)
        }
    } else if stack.isEmpty || getPriority(ch) > getPriority(stack.last!) {
        stack.append(ch)
    } else {
        while !stack.isEmpty {
            let temp = stack.last!
            if getPriority(temp) >= getPriority(ch) {
                let data = stack.removeLast()
                answer.append(data)
            } else {
                break
            }
        }
        stack.append(ch)
    }
}

while !stack.isEmpty {
    answer.append(stack.removeLast())
}

print(answer)
