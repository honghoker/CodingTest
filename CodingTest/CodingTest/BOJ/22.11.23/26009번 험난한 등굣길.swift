//  백준 - 험난한 등굣길
//  https://www.acmicpc.net/problem/26009
//  Created by 홍은표 on 2022/11/23.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
let K = Int(readLine()!)!
var visit = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

let dx2 = [1, -1, -1, 1]
let dy2 = [-1, 1, -1, 1]

var answer = 0
var queue = [(1, 1)]
visit[1][1] = 1

func setTraffic() {
    for _ in 0..<K {
        let RCD = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (R, C, D) = (RCD[0], RCD[1], RCD[2])
        
        for i in 0...3 {
            let nX = R + dx[i] * D
            let nY = C + dy[i] * D
            for j in stride(from: 0, through: D, by: 1) {
                let nnX = nX + dx2[i] * j
                let nnY = nY + dy2[i] * j
                if nnX < 1 || nnY < 1 || nnX > N || nnY > M { continue }
                visit[nnX][nnY] = 1
            }
        }
    }
}

func bfs() {
    var queue = [(1, 1)]
    var front = 0
    
    while front < queue.count {
        let (x, y) = queue[front]
        front += 1
        if x == N && y == M { answer = visit[x][y] - 1; return }
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]
            if nX < 1 || nY < 1 || nX > N || nY > M || visit[nX][nY] > 0 { continue }
            if visit[nX][nY] == 0 {
                visit[nX][nY] = visit[x][y] + 1
                queue.append((nX, nY))
            }
        }
    }
}

setTraffic()
bfs()
    
if answer == 0 {
    print("NO")
} else {
    print("YES\n\(answer)")
}
