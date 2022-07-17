//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (input[0], input[1])

var visit = Array(repeating: Array(repeating: false, count: C), count: R)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var map = [[String]]()
var (sx, sy) = (-1, -1)
var (ex, ey) = (-1, -1)
var swanQueue: [(Int, Int)] = []
var waterQueue: [(Int, Int)] = []

for i in 0..<R {
    map.append(readLine()!.map{ String($0) })
    for j in 0..<C {
        if map[i][j] == "L" {
            if sx == -1 && sy == -1 {
                sx = i; sy = j
            } else {
                ex = i; ey = j
            }
            map[i][j] = "."
            // 1 7
            // LXX.XXL 상황 예외처리
            waterQueue.append((i, j))
        } else if map[i][j] == "." {
            waterQueue.append((i, j))
        }
    }
}

func meltIce() {
    var nextWaterQueue: [(Int, Int)] = [] // 그 다음날 방문할 빙판
    var front = 0
    while front < waterQueue.count {
        let (x, y) = waterQueue[front]
        front += 1
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]

            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                continue
            }
            if map[nX][nY] == "X" { // 빙판을 찾을 경우
                // 물로 만들어주고 queue에 좌표를 추가
                map[nX][nY] = "."
                nextWaterQueue.append((nX, nY))
            }
        }
    }
    // 기존의 Queue에 새로 생성한 Queue 대입
    waterQueue = nextWaterQueue
}

func bfs() -> Bool {
    var nextSwanQueue: [(Int, Int)] = []
    var front = 0

    while front < swanQueue.count {
        let (x, y) = swanQueue[front]
        front += 1
        
        if x == ex && y == ey { //
            return true
        }
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]

            if nX < 0 || nY < 0 || nX >= R || nY >= C || visit[nX][nY] {
                continue
            }
            visit[nX][nY] = true
            if map[nX][nY] == "X" {
                nextSwanQueue.append((nX, nY))
                continue
            }
            swanQueue.append((nX, nY))
        }
    }
    swanQueue = nextSwanQueue
    
    return false
}

swanQueue = [(sx, sy)]
visit[sx][sy] = true

var answer = 0
while true {
    if bfs() { break }
    meltIce()
    answer += 1
}

print(answer)
