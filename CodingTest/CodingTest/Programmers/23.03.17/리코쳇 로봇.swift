//  프로그래머스 - 리코쳇 로봇
//  https://school.programmers.co.kr/learn/courses/30/lessons/169199
//  Created by 홍은표 on 2023/03/17.

import Foundation

func solution(_ board:[String]) -> Int {
    var board = board.map { $0.map { String($0) } }
    let n = board.count, m = board[0].count
    var visit = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: m), count: n)
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    
    var queue = [(Int, Int, Int)]()
    var front = 0
    
    for i in 0..<board.count {
        let j = board[i].enumerated().filter { $0.element == "R" }.map { $0.offset }
        if !j.isEmpty {
            queue.append((i, j[0], 0))
            board[i][j[0]] = "."
            break
        }
    }
    
    func move(_ robot: (Int, Int), _ i: Int) -> (Int, Int) {
        var (x, y) = (robot.0, robot.1)
        while true {
            let (nX, nY) = (x + dx[i], y + dy[i])
            if nX < 0 || nY < 0 || nX >= n || nY >= m || board[nX][nY] == "D" { break }
            (x, y) = (nX, nY)
        }
        return (x, y)
    }
    
    while front < queue.count {
        let (x, y, count) = queue[front]
        front += 1
        for i in 0...3 {
            let (nX, nY) = move((x, y), i)
            if board[nX][nY] == "G" { return count + 1 }
            if visit[nX][nY][i] == false {
                visit[nX][nY][i] = true
                queue.append((nX, nY, count + 1))
            }
        }
    }
    
    return -1
}
