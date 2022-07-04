//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/03.
//

import Foundation

let FSGUD = readLine()!.split(separator: " ").map { Int(String($0))! }
let (F, S, G, U, D) = (FSGUD[0], FSGUD[1], FSGUD[2], FSGUD[3], FSGUD[4])

func bfs() -> Int {
    var queue = [(S, 0)]
    var front = 0
    
    var visit = Array(repeating: false, count: F+1)
    visit[S] = true
    
    while front < queue.count {
        let (now, depth) = queue[front]
        front += 1
        
        if now == G {
            return depth
        }
        
        for nX in [now + U, now - D] {
            if (1...F).contains(nX) && !visit[nX] {
                visit[nX] = true
                queue.append((nX, depth + 1))
            }
        }
    }
    return -1
}

let answer = bfs()
print(answer == -1 ? "use the stairs" : answer )
