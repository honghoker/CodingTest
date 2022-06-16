//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var answer = 0

var virusArea = [(Int, Int)]()

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 2 {
            virusArea.append((i, j))
        }
    }
}

func dfs(_ depth: Int) {
    if depth == 3 {
        bfs()
        return
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] == 0 {
                map[i][j] = 1
                dfs(depth + 1)
                map[i][j] = 0
            }
        }
    }
}

func bfs() {
    var temp = map
    var queue = virusArea
    var front = 0
    while front < queue.count {
        let node = queue[front]
        front += 1

        for i in 0...3 {
            let nX = node.0 + dx[i]
            let nY = node.1 + dy[i]

            if nX < 0 || nY < 0 || nX >= N || nY >= M {
                continue
            }

            if temp[nX][nY] == 0 {
                temp[nX][nY] = 2
                queue.append((nX, nY))
            }
        }
    }

    var count = 0
    for m in temp {
        count += m.filter { $0 == 0 }.count
    }

    answer = max(answer, count)
}

dfs(0)

print(answer)
