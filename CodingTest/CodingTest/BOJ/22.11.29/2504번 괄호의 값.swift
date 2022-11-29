//  백준 - 괄호의 값
//  https://www.acmicpc.net/problem/2504
//  Created by 홍은표 on 2022/11/29.

import Foundation

let str = readLine()!.map { String($0) }
var stack = [String]()
var sum = 1, answer = 0
var isPossible = true

for i in 0..<str.count {
    if str[i] == "(" || str[i] == "[" {
        sum *= str[i] == "(" ? 2 : 3
        stack.append(str[i])
    } else if str[i] == ")" {
        if stack.isEmpty || stack.last != "(" { isPossible = false; break }
        if str[i-1] == "(" { answer += sum }
        stack.removeLast()
        sum /= 2
    } else if str[i] == "]" {
        if stack.isEmpty || stack.last != "[" { isPossible = false; break }
        if str[i-1] == "[" { answer += sum }
        stack.removeLast()
        sum /= 3
    }
}

if isPossible && stack.isEmpty {
    print(answer)
} else {
    print(0)
}
