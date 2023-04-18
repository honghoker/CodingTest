//  백준 - 강아지는 많을수록 좋다
//  https://www.acmicpc.net/problem/27971
//  Created by 홍은표 on 2023/04/16.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, A, B) = (input[0], input[1], input[2], input[3])
var close = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s, e) = (input[0], input[1])
    for i in s...e {
        if close[i] == true { break }
        close[i] = true
    }
    
    for i in (s...e).reversed() {
        if close[i] == true { break }
        close[i] = true
    }
}

var queue = [(0, 0)]
var front = 0
var answer = -1
while front < queue.count {
    let (dog, count) = queue[front]
    front += 1
    if dog == N { answer = count; break }
    
    if dog + A <= N && close[dog + A] == false {
        close[dog + A] = true
        queue.append((dog + A, count + 1))
    }
    
    if dog + B <= N && close[dog + B] == false {
        close[dog + B] = true
        queue.append((dog + B, count + 1))
    }
}

print(answer)
