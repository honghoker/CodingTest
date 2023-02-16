//  프로그래머스 - 미로 탈출
//  https://school.programmers.co.kr/learn/courses/30/lessons/159993#
//  Created by 홍은표 on 2023/02/16.

import Foundation

func solution(_ maps:[String]) -> Int {
    let map = maps.map { $0.map { $0 } }
    let col = map.count, row = map[0].count
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var start = (0, 0), exit = (0, 0), lever = (0, 0)

    for i in 0..<map.count {
        for j in 0..<map[i].count {
            switch map[i][j] {
                case "S": start = (i, j)
                case "E": exit = (i, j)
                case "L": lever = (i, j)
                default: break
            }
        }
    }
    
    func getFindLeverTime() -> Int {
        var queue = [(start.0, start.1, 0)]
        var front = 0
        var visit = Array(repeating: Array(repeating: false, count: row), count: col)
        visit[start.0][start.1] = true
        
        while front < queue.count {
            let (x, y, count) = queue[front]
            front += 1
            
            for i in 0...3 {
                let nX = x + dx[i]
                let nY = y + dy[i]
                
                if nX == lever.0 && nY == lever.1 { return count + 1 }
                if nX < 0 || nY < 0 || nX >= col || nY >= row || visit[nX][nY] { continue }
                
                if map[nX][nY] != "X" {
                    queue.append((nX, nY, count + 1))
                    visit[nX][nY] = true
                }
            }
        }
        
        return -1
    }
    
    func getFindExitTime() -> Int {
        var queue = [(lever.0, lever.1, 0)]
        var front = 0
        var visit = Array(repeating: Array(repeating: false, count: row), count: col)
        visit[lever.0][lever.1] = true
        
        while front < queue.count {
            let (x, y, count) = queue[front]
            front += 1
            
            for i in 0...3 {
                let nX = x + dx[i]
                let nY = y + dy[i]
                
                if nX == exit.0 && nY == exit.1 { return count + 1 }
                if nX < 0 || nY < 0 || nX >= col || nY >= row || visit[nX][nY] { continue }
                
                if map[nX][nY] != "X" {
                    queue.append((nX, nY, count + 1))
                    visit[nX][nY] = true
                }
            }
        }
        
        return -1
    }
    
    let leverTime = getFindLeverTime()
    if leverTime == -1 { return -1 }
    let exitTime = getFindExitTime()
    if exitTime == -1 { return -1 }
    return leverTime + exitTime
}
