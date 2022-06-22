//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/20.
//

import Foundation

let N = Int(readLine()!)!

var map: [[Int]] = Array(repeating: [], count: N+1)
var visit = Array(repeating: false, count: N+1)
var answer = Array(repeating: -1, count: N+1)

for _ in 0..<N - 1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[input[0]].append(input[1])
    map[input[1]].append(input[0])
}

for i in 1...N {
    if !visit[i] {
        visit[i] = true
        var queue = [i]
        var front = 0

        while front < queue.count {
            let node = queue[front]
            front += 1
            for j in 0..<map[node].count {
                if !visit[map[node][j]] {
                    visit[map[node][j]] = true
                    queue.append(map[node][j])
                    answer[map[node][j]] = node
                }
            }
        }
    }
}

for i in 2...N {
    print(answer[i])
}
