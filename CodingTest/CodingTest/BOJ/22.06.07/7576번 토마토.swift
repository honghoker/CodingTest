//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var queue = [(x : Int, y : Int)]()

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 1 {
            queue.append((x : i, y: j))
        }
    }
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var idx = 0

while idx < queue.count {
    let node = queue[idx]
    idx += 1
    
    for i in 0...3 {
        let nX = node.x + dx[i]
        let nY = node.y + dy[i]
        
        if nX < 0 || nX >= N || nY < 0 || nY >= M {
            continue
        }
        
        if map[nX][nY] == 0 {
            map[nX][nY] = map[node.x][node.y] + 1
            queue.append((x : nX, y : nY))
        }
    }
}

var answer = 0

for i in 0..<N {
    if map[i].contains(0) == true {
        answer = -1
        break
    }
    if map[i].max()! - 1  > answer {
        answer = map[i].max()! - 1
    }
}

print(answer)

