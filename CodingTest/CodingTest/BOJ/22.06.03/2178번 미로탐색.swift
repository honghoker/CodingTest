//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.map{ Int(String($0))! })
}

var queue = [(x: 0, y: 0)]
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in 0..<4 {
        let nextX  = node.x + dx[i]
        let nextY = node.y + dy[i]
        
        if nextX < 0 || nextY < 0 || nextX >= n || nextY >= m {
            continue
        } else {
            if map[nextX][nextY] == 0 {
                continue
            } else if map[nextX][nextY] == 1 {
                map[nextX][nextY] = map[node.x][node.y] + 1
                queue.append((x: nextX, y: nextY))
            }
        }
    }
}

print(map[n-1][m-1])
