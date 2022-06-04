//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

let N = Int(readLine()!)!

var map = [[String]]()

var dx = [0, 0, 1, -1]
var dy = [1, -1, 0, 0]

for _ in 0..<N {
    map.append(readLine()!.map{ String($0) })
}

var normalPerson = Array(repeating: Array(repeating: 0, count: N), count: N)
var colorPerson = Array(repeating: Array(repeating: 0, count: N), count: N)

var normarlCount = 0
var colorCount = 0

for i in 0..<N {
    for j in 0..<N {
        if normalPerson[i][j] == 0 {
            normalPerson[i][j] = 0
            normarlCount += 1
            
            var stack = [(x: i, y: j)]
            while !stack.isEmpty {
                let node = stack.removeLast()
                let color = map[node.x][node.y]
                
                for i in 0..<dx.count {
                    let startX = node.x + dx[i]
                    let startY = node.y + dy[i]
                    
                    if startX < 0 || startX >= N || startY < 0 || startY >= N {
                        continue
                    } else {
                        if normalPerson[startX][startY] == 1 {
                            continue
                        } else {
                            if map[startX][startY] == color {
                                normalPerson[startX][startY] = 1
                                stack.append((x: startX, y: startY))
                            }
                        }
                    }
                }
            }
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        if colorPerson[i][j] == 0 {
            colorPerson[i][j] = 0
            colorCount += 1
            
            var stack = [(x: i, y: j)]
            while !stack.isEmpty {
                let node = stack.removeLast()
                let color = map[node.x][node.y]
                
                for i in 0..<dx.count {
                    let startX = node.x + dx[i]
                    let startY = node.y + dy[i]
                    
                    if startX < 0 || startX >= N || startY < 0 || startY >= N {
                        continue
                    } else {
                        if colorPerson[startX][startY] == 1 {
                            continue
                        } else {
                            if color == "G" || color == "R" {
                                if map[startX][startY] == "G" || map[startX][startY] == "R" {
                                    colorPerson[startX][startY] = 1
                                    stack.append((x: startX, y: startY))
                                }
                            } else if color == "B" {
                                if map[startX][startY] == color {
                                    colorPerson[startX][startY] = 1
                                    stack.append((x: startX, y: startY))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

print("\(normarlCount) \(colorCount)")
