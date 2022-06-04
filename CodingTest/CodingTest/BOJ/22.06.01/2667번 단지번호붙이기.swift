//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.map { Int(String($0))! })
}

var answer = [Int]()
var complexNumber = 0

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            complexNumber += 1
            
            var stack = [(x : i, y: j)]
            
            map[i][j] = 0
            let dx = [0, 0, 1, -1]
            let dy = [1, -1, 0, 0]
            var out = 1
            
            while !stack.isEmpty {
                let node = stack.removeLast()
                
                for i in 0..<dx.count {
                    let nextX = node.x + dx[i]
                    let nextY = node.y + dy[i]
                    if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N {
                        continue
                    } else {
                        if map[nextX][nextY] == 1 {
                            map[nextX][nextY] = 0
                            stack.append((x: nextX, y: nextY))
                            out += 1
                        }
                    }
                }
            }
            answer.append(out)
        }
    }
}

print(complexNumber)
print(answer.sorted().map{ String($0) }.joined(separator: "\n") )
