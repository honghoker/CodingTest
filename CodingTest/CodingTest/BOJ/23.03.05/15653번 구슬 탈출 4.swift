//  백준 - 구슬 탈출 4
//  https://www.acmicpc.net/problem/15653
//  Created by 홍은표 on 2023/03/05.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var board = [[String]]()
var red = (0, 0), blue = (0, 0)
for i in 0..<N {
    board.append(readLine()!.map { String($0) })
    for j in 0..<M {
        if board[i][j] == "R" { red = (i, j); board[i][j] = "." }
        if board[i][j] == "B" { blue = (i, j); board[i][j] = "." }
    }
}

func move(_ f: (Int, Int), _ s: (Int, Int), _ i: Int) -> ((Int, Int), (Int, Int)) {
    var f = f, s = s
    
    while true {
        let (nFX, nFY) = (f.0 + dx[i], f.1 + dy[i])
        if nFX < 0 || nFY < 0 || nFX >= N || nFY >= M || board[nFX][nFY] == "#" { break }
        f = (nFX, nFY)
        if board[nFX][nFY] == "O" { break }
    }
    
    while true {
        let (nSX, nSY) = (s.0 + dx[i], s.1 + dy[i])
        if nSX < 0 || nSY < 0 || nSX >= N || nSY >= M || board[nSX][nSY] == "#" { break }
        if (nSX, nSY) == f, board[f.0][f.1] != "O" { break }
        s = (nSX, nSY)
        if board[nSX][nSY] == "O" { break }
    }
    
    return (f, s)
}

func bfs() -> Int {
    var queue = [(r: red, b: blue, c: 0)]
    var front = 0
    var visit = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: M), count: N)
    visit[red.0][red.1][blue.0][blue.1] = true
    
    while front < queue.count {
        let (r, b, c) = queue[front]
        front += 1
        
        for i in 0...3 {
            var nRX = r.0, nRY = r.1
            var nBX = b.0, nBY = b.1
            
            switch i {
            case 0:
                if nRY > nBY {
                    ((nRX, nRY), (nBX, nBY)) = move((nRX, nRY), (nBX, nBY), i)
                } else {
                    ((nBX, nBY), (nRX, nRY)) = move((nBX, nBY), (nRX, nRY), i)
                }
            case 1:
                if nRY < nBY {
                    ((nRX, nRY), (nBX, nBY)) = move((nRX, nRY), (nBX, nBY), i)
                } else {
                    ((nBX, nBY), (nRX, nRY)) = move((nBX, nBY), (nRX, nRY), i)
                }
            case 2:
                if nRX > nBX {
                    ((nRX, nRY), (nBX, nBY)) = move((nRX, nRY), (nBX, nBY), i)
                } else {
                    ((nBX, nBY), (nRX, nRY)) = move((nBX, nBY), (nRX, nRY), i)
                }
            case 3:
                if nRX < nBX {
                    ((nRX, nRY), (nBX, nBY)) = move((nRX, nRY), (nBX, nBY), i)
                } else {
                    ((nBX, nBY), (nRX, nRY)) = move((nBX, nBY), (nRX, nRY), i)
                }
            default: break
            }
        
            if visit[nRX][nRY][nBX][nBY] { continue }
            if board[nRX][nRY] == "O" && board[nBX][nBY] == "." {
                return c + 1
            } else if board[nRX][nRY] == "." && board[nBX][nBY] == "." {
                queue.append((r: (nRX, nRY), b: (nBX, nBY), c: c + 1))
                visit[nRX][nRY][nBX][nBY] = true
            }
        }
    }

    return -1
}

print(bfs())
