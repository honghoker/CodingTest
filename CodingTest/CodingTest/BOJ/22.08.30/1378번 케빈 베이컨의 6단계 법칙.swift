//
//  1378번 케빈 베이컨의 6단계 법칙.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/30.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var map = [Int: [Int]]()
var friend = Array(repeating: Array(repeating: false, count: N+1), count: N+1)
var answer = Array(repeating: Int.max, count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[input[0], default: []].append(input[1])
    map[input[1], default: []].append(input[0])
}

func bfs(_ now: Int) -> Int {
    var queue: [(Int, Int)] = [(now, 0)]
    var visit = Array(repeating: false, count: N + 1)
    visit[now] = true
    var idx = 0
    var sum = 0
    
    while idx < queue.count {
        let node = queue[idx]
        idx += 1
        sum += node.1
        
        if let nexts = map[node.0] {
            for next in nexts {
                if visit[next] == false {
                    visit[next] = true
                    queue.append((next, node.1 + 1))
                }
            }
        }
    }
    
    return sum
}

for i in 1...N {
    answer[i] = bfs(i)
}

print(answer.firstIndex(of: answer.min()!)!)
