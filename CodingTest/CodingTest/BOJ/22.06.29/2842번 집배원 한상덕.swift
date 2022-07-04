//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/28.
//

import Foundation

let N = Int(readLine()!)!

var map = [[String]]()
var cost = [[Int]]()

let dx = [-1, 1, 0, 0, -1, 1, 1, -1]
let dy = [0, 0, -1, 1, -1, -1, 1, 1]

var sp = (-1, -1)
var house = 0


for i in 0..<N {
    map.append(readLine()!.map { String($0) })
    for j in 0..<N {
        if map[i][j] == "P" {
            sp = (i, j)
        } else if map[i][j] == "K" {
            house += 1
        }
    }
}
for _ in 0..<N {
    cost.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let costSort = Set<Int>(cost.joined().map { Int(String($0))! }).sorted { $0 < $1 }
var (left, right) = (0, 0)
var answer = Int.max
let length = costSort.count

func bfs() -> Int {
    var count = 0
    var queue = [(sp.0, sp.1)]
    var front = 0
    var visit = Array(repeating: Array(repeating: false, count: N), count: N)
    visit[sp.0][sp.1] = true
    
    while front < queue.count {
        let node = queue[front]
        front += 1
        
        for i in 0...7 {
            let nX = node.0 + dx[i]
            let nY = node.1 + dy[i]
            
            if nX < 0 || nY < 0 || nX >= N || nY >= N || visit[nX][nY] {
                continue
            }
            
            if costSort[left] <= cost[nX][nY] && cost[nX][nY] <= costSort[right] {
                visit[nX][nY] = true
                queue.append((nX, nY))
                
                if map[nX][nY] == "K" {
                    count += 1
                }
            }
        }
    }
    
    return count
}

while left < length {
    var count = 0
    // 시작점의 고도가 최대 고도와 최소 고도 사이일 경우에만 BFS 시작
    if costSort[left] <= cost[sp.0][sp.1] && cost[sp.0][sp.1] <= costSort[right] {
        count = bfs()
    }
    
    // 집을 모두 방문했을 경우
    if count == house {
        // 최소 피로도 구하기
        answer = min(answer, costSort[right] - costSort[left])
        
        //최소 높이 증가
        left += 1
    } else if right + 1 < length {
        // 아직 최대 고도가 남아있을 때 최대 고도 증가
        right += 1
    } else {
        // 모두 아니면 종료
        break
    }
}

print(answer)
