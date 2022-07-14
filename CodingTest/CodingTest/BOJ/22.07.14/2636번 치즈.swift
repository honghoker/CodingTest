//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/14.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var map = [[Int]]()
var visit = Array(repeating: Array(repeating: false, count: M), count: N)
var queue = [(Int, Int, Int)]()
var front = 0

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
queue.append((0, 0, 1))

func cheeseFind(_ x: Int, _ y: Int, _ value: Int) {
    visit[x][y] = true
    
    for i in 0...3 {
        let nX = x + dx[i]
        let nY = y + dy[i]
        
        if nX < 0 || nY < 0 || nX >= N || nY >= M {
            continue
        }
        
        if map[nX][nY] == 0 && !visit[nX][nY] {
            cheeseFind(nX, nY, value)
        } else if map[nX][nY] == 1 {
            map[nX][nY] = value + 1
            visit[nX][nY] = true
            queue.append((nX, nY, value + 1))
        }
    }
}

while front < queue.count {
    let (x, y, value) = queue[front]
    front += 1
    cheeseFind(x, y, value)
}

if queue.count == 1 {
    print(0)
    print(0)
} else {
    print(queue.last!.2 - 1)
    print(queue.filter({ $0.2 == queue.last!.2 }).count)
}
