//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: M), count: N)
var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var answer = -1

var queue = [(0, 0, 1, 1)]
visit[0][0][1] = true

var front = 0
while front < queue.count {
    let node = queue[front]
    front += 1
    
    let x = node.0
    let y = node.1
    let dist = node.2
    let crash = node.3
    
    if x == N - 1 && y == M - 1 {
        answer = dist
        break
    }
    
    for i in 0...3 {
        let nX = x + dx[i]
        let nY = y + dy[i]
        
        if nX < 0 || nY < 0 || nX >= N || nY >= M || visit[nX][nY][crash] == true {
            continue
        }
        
        if map[nX][nY] == 0 {
            visit[nX][nY][crash] = true
            queue.append((nX, nY, dist + 1, crash))
        }
        
        if map[nX][nY] == 1 && crash == 1 {
            visit[nX][nY][crash - 1] = true
            queue.append((nX, nY, dist + 1, crash - 1))
        }
    }
}

print(answer)
