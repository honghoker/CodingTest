//  백준 - 크게 만들기
//  https://www.acmicpc.net/problem/2812
//  Created by 홍은표 on 2023/08/01.

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Character](), k = NK[1]
for ch in readLine()! {
    while k > 0, let last = stack.last, last < ch {
        stack.removeLast()
        k -= 1
    }
    stack.append(ch)
}

while k > 0 {
    stack.removeLast()
    k -= 1
}

print(String(stack))
