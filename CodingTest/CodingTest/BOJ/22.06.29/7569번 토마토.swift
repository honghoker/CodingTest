//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/29.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N, H) = (input[0], input[1], input[2])

let d = [(-1, 0, 0), (1, 0, 0), (0, 0, -1), (0, 0, 1), (0, 1, 0), (0, -1, 0)]

var map: [[[Int]]] = Array(repeating: [], count: H)

var queue = [(Int, Int, Int)]()
for i in 0..<H {
    for j in 0..<N {
        map[i].append(readLine()!.split(separator: " ").map { Int(String($0))! })
        for k in 0..<M {
            if map[i][j][k] == 1 {
                queue.append((i, j, k))
            }
        }
    }
}

var answer = 0

func bfs() {
    var front = 0
    while front < queue.count {
        let node = queue[front]
        front += 1
        let z = node.0
        let x = node.1
        let y = node.2

        for i in 0...5 {
            let nZ = z + d[i].0
            let nX = x + d[i].1
            let nY = y + d[i].2

            if nZ < 0 || nX < 0 || nY < 0 || nZ >= H || nX >= N || nY >= M {
                continue
            }

            if map[nZ][nX][nY] == 0 {
                map[nZ][nX][nY] = map[z][x][y] + 1
                queue.append((nZ, nX, nY))
            }
        }
    }
}

bfs()
func result() -> Int {
    var answer = 0
    for m1 in map {
        for m2 in m1 {
            if m2.contains(0) { return -1 }
            answer = max(answer, m2.max()!)
        }
    }
    return answer - 1
}

print(result())
