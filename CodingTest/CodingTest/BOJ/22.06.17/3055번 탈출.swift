//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (input[0], input[1])
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var map = [[String]]()
var water = [(Int, Int, Int)]()
var gosm = [(Int, Int, Int)]()
var visit = Array(repeating: Array(repeating: false, count: C), count: R)

for i in 0..<R {
    map.append(readLine()!.map { String($0) })
    for j in 0..<C {
        if map[i][j] == "S" { gosm.append((i, j, 0)); visit[i][j] = true }
        if map[i][j] == "*" { water.append((i, j, 0)) }
    }
}

var waterFront = 0

func flood(_ now_time: Int) {
    while waterFront < water.count {
        let node = water[waterFront]
        waterFront += 1
        let x = node.0
        let y = node.1
        let time = node.2
        
        if time != now_time {
            waterFront -= 1
            return
        }
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C || map[nX][nY] == "X" || map[nX][nY] == "D" || map[nX][nY] == "*" {
                continue
            }
            
            map[nX][nY] = "*"
            water.append((nX, nY, time + 1))
        }
    }
}

func bfs() -> Int {
    var front = 0
    var prev_time = 0
    
    while front < gosm.count {
        let node = gosm[front]
        front += 1
        let x = node.0
        let y = node.1
        let time = node.2
        
        if time != prev_time {
            flood(prev_time)
            prev_time = time
        }
        
        if map[x][y] == "*" {
            continue
        }
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C || map[nX][nY] == "X" || map[nX][nY] == "*" || visit[nX][nY] {
                continue
            }

            if map[nX][nY] == "D" {
                return time + 1
            }
            
            if map[nX][nY] == "." {
                visit[nX][nY] = true
                gosm.append((nX, nY, time + 1))
            }
        }
    }
    return -1
}

let answer = bfs()

if answer == -1 {
    print("KAKTUS")
} else {
    print(answer)
}
