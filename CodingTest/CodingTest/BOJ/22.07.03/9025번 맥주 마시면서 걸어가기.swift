//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/03.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var edges = [(Int, Int)]()
    
    for _ in 0..<n+2 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges.append((input[0], input[1]))
    }

    var map = Array(repeating: [Int](), count: n + 2)
    let length = edges.count
    
    for i in 0..<length-1 {
        for j in i+1..<length {
            if (abs(edges[i].0 - edges[j].0) + abs(edges[i].1 - edges[j].1)) <= 1000 {
                map[i].append(j)
                map[j].append(i)
            }
        }
    }
    
    var answer = false
    var visit = Array(repeating: false, count: n + 2)
    var queue = [0]
    var front = 0
    while front < queue.count {
        let x = queue[front]
        front += 1
        
        if x == n + 1 {
            answer = true
            break
        }
        
        for nX in map[x] {
            if !visit[nX] {
                visit[nX] = true
                queue.append(nX)
            }
        }
    }
    
    print(answer ? "happy" : "sad")
}
