//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (M, N, K) = (input[0], input[1], input[2])

    var map = Array(repeating: Array(repeating: 0, count: M), count: N)

    for _ in 0..<K {
        let position = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = position[0]
        let y = position[1]
        map[y][x] = 1
    }

    var jirungE = 0

    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] == 1 {
                var stack = [(x : i, y : j)]
                
                jirungE += 1
                
                map[i][j] = 0
                let dx = [0, 0, 1, -1]
                let dy = [1, -1, 0, 0]
                
                while !stack.isEmpty {
                    let node = stack.removeLast()
                    
                    for i in 0..<dx.count {
                        let nextX = node.x + dx[i]
                        let nextY = node.y + dy[i]
                        
                        if nextX < 0 || nextX >= N || nextY < 0 || nextY >= M {
                            continue
                        } else {
                            if map[nextX][nextY] == 1 {
                                map[nextX][nextY] = 0
                                stack.append((x: nextX, y: nextY))
                            }
                        }
                    }
                }
            }
        }
    }
    print(jirungE)
}
