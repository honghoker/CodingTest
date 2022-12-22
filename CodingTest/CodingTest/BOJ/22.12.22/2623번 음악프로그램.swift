//  백준 - 음악프로그램
//  https://www.acmicpc.net/problem/2623
//  Created by 홍은표 on 2022/12/22.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var nodes = Array(repeating: [Int](), count: N+1)
var inDegree = Array(repeating: 0, count: N+1)

for _ in 0..<M {
    let singer = readLine()!.split(separator: " ").map { Int(String($0))! }
    for i in 1..<singer[0] {
        nodes[singer[i]].append(singer[i+1])
        inDegree[singer[i+1]] += 1
    }
}

var queue = [Int]()
for i in 1...N where inDegree[i] == 0 { queue.append(i) }

var front = 0
var answer = [Int]()
while front < queue.count {
    let node = queue[front]
    front += 1
    answer.append(node)
    for next in nodes[node] {
        inDegree[next] -= 1
        if inDegree[next] == 0 { queue.append(next) }
    }
}

print(answer.count != N ? "0" : answer.map { String($0) }.joined(separator: "\n"))
