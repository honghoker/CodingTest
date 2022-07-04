//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func meltIce() {
    var visit = Array(repeating: Array(repeating: false, count: M), count: N)
    
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] != 0 && !visit[i][j] {
                visit[i][j] = true
                var count = 0
                for k in 0...3 {
                    let nX = i + dx[k]
                    let nY = j + dy[k]
                    if nX < 0 || nY < 0 || nX >= N || nY >= M {
                        continue
                    }
                    
                    if !visit[nX][nY] && map[nX][nY] == 0 {
                        count += 1
                    }
                }
                map[i][j] -= count
                if map[i][j] < 0 { map[i][j] = 0}
            }
        }
    }
}

func countingIce() -> Bool {
    var visit = Array(repeating: Array(repeating: false, count: M), count: N)
    var count = 0
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] != 0 && !visit[i][j] {
                count += 1
                if count >= 2 { return true }
                var queue = [(i, j)]
                var front = 0
                
                while front < queue.count {
                    let node = queue[front]
                    front += 1
                    
                    for k in 0...3 {
                        let nX = node.0 + dx[k]
                        let nY = node.1 + dy[k]
                        
                        if nX < 0 || nY < 0 || nX >= N || nY >= M {
                            continue
                        }
                        
                        if !visit[nX][nY] && map[nX][nY] != 0 {
                            visit[nX][nY] = true
                            queue.append((nX, nY))
                        }
                    }
                }
            }
        }
    }
    
    return false
}


var answer = 0

func allMeltCheck() -> Bool {
    for i in 0..<N {
        if map[i].filter({ $0 > 0 }).count > 0 {
            return false
        }
    }
    return true
}

while true {
    meltIce(); answer += 1
    if allMeltCheck() { answer = 0; break }
    if countingIce() { break }
}

print(answer)
