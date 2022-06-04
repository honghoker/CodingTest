//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/02.
//

import Foundation

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (w, h) = (input[0], input[1])
    if w == 0 && h == 0 { break }

    var map = [[Int]]()

    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }


    var island = 0

    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 {
                map[i][j] = 0
                    
                island += 1
                
                var stack = [(x: i, y: j)]
                
                let dx = [0, 0, 1, -1, 1, -1, 1, -1]
                let dy = [1, -1, 0, 0, 1, -1, -1, 1]
                
                while !stack.isEmpty {
                    let node = stack.removeLast()
                    
                    for i in 0..<dx.count {
                        let startX = node.x + dx[i]
                        let startY = node.y + dy[i]
                        
                        if startX < 0 || startX >= h || startY < 0 || startY >= w {
                            continue
                        } else {
                            if map[startX][startY] == 1 {
                                map[startX][startY] = 0
                                stack.append((x: startX, y: startY))
                            }
                        }
                    }
                }
            }
        }
    }

    print(island)
}
