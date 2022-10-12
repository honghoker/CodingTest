//  백준 - 보물섬
//  https://www.acmicpc.net/problem/2589
//  Created by 홍은표 on 2022/10/13.

import Foundation

let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (RC[0], RC[1])
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var map = [[String]]()

for _ in 0..<R {
    map.append(readLine()!.map { String($0) })
}

func bfs(_ x: Int, _ y: Int) -> Int {
    var queue = [(x, y)]
    var front = 0
    var visit = Array(repeating: Array(repeating: -1, count: C), count: R)
    visit[x][y] = 0
    var result = 0
    
    while front < queue.count {
        let (x, y) = queue[front]
        front += 1
        
        if result < visit[x][y] { result = visit[x][y] }
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C { continue }
            if visit[nX][nY] != -1 || map[nX][nY] == "W" { continue }
            
            queue.append((nX, nY))
            visit[nX][nY] = visit[x][y] + 1
        }
    }
    return result
}

var answer = 0
for i in 0..<R {
    for j in 0..<C {
        if map[i][j] == "L" {
            answer = max(answer, bfs(i, j))
        }
    }
}

print(answer)
