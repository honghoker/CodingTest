//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

let N = Int(readLine()!)!

var map = [[Int]]()
var dx = [0, 0, 1, -1]
var dy = [1, -1, 0, 0]

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var answer = 0

for i in 0...100 {
    let result = dfs(i)
    if result == 0 {
        break
    }
    if answer < result {
        answer = result
    }
}

func dfs(_ height: Int) -> Int {
    var area = 0
    var arr = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] > height && arr[i][j] == 0 {
                arr[i][j] = 1
                area += 1
                
                var stack = [(x : i, y : j)]
                
                while !stack.isEmpty {
                    let node = stack.removeFirst()
                    
                    for i in 0..<dx.count {
                        let startX = node.x + dx[i]
                        let startY = node.y + dy[i]
                            
                        if startX < 0 || startX >= N || startY < 0 || startY >= N {
                            continue
                        } else {
                            if arr[startX][startY] == 1 {
                                continue
                            } else {
                                if map[startX][startY] > height {
                                    arr[startX][startY] = 1
                                    stack.append((x : startX, y : startY))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return area
}

print(answer)
