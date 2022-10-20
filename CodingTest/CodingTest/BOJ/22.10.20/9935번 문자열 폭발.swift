//  백준 - 문자열 폭발
//  https://www.acmicpc.net/problem/9935
//  Created by 홍은표 on 2022/10/20.

import Foundation

let s = readLine()!
let find = Array(readLine()!)
var stack = [Character]()

s.forEach {
    stack.append($0)

    if $0 == find.last {
        if stack.count >= find.count {
            var bomb = true
            for i in 0..<find.count {
                if find[find.count - 1 - i] != stack[stack.count - 1 - i] {
                    bomb = false; break
                }
            }
            if bomb { for _ in 0..<find.count { stack.removeLast() } }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))
