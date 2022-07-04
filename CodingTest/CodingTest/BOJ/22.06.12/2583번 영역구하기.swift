//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N, K) = (input[0], input[1], input[2])

// M 세로, N 가로

var map = Array(repeating: Array(repeating: -1, count: N), count : M)

for _ in 0..<K {
    let coor = readLine()!.split(separator: " ").map { Int(String($0))! }
    let leftTop = (M-coor[3], coor[0])
    let rightBottom = (M-coor[1] - 1, coor[2])
    
    for i in leftTop.0...rightBottom.0 {
        for j in leftTop.1..<rightBottom.1 {
            map[i][j] = 1
        }
    }
}

var answer = 0

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var countArr = [Int]()

for i in 0..<M {
    for j in 0..<N {
        if map[i][j] == -1 {
            map[i][j] = 0
            answer += 1
            
            var count = 1
            var stack = [(x: i, y: j)]
            
            while !stack.isEmpty {
                let node = stack.removeLast()
                
                for i in 0...3 {
                    let nX = node.x + dx[i]
                    let nY = node.y + dy[i]
                    
                    if nX < 0 || nY < 0 || nX >= M || nY >= N {
                        continue
                    } else {
                        if map[nX][nY] == -1 {
                            map[nX][nY] = 0
                            count += 1
                            stack.append((x: nX, y: nY))
                        }
                    }
                }
            }
            countArr.append(count)
        }
    }
}

print(answer)
print(countArr.sorted { $0 < $1 }.map { String($0) }.joined(separator: " "))
