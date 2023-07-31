//  백준 - 청소년 상어
//  https://www.acmicpc.net/problem/19236
//  Created by 홍은표 on 2023/08/01.

import Foundation

struct Fish {
    var x: Int
    var y: Int
    var d: Int
}

let dx = [-1, -1, 0, 1, 1, 1, 0, -1], dy = [0, -1, -1, -1, 0, 1, 1, 1]
var fish = [Fish](repeating: Fish(x: -1, y: -1, d: -1), count: 16)
var map = Array(repeating: Array(repeating: 0, count: 4), count: 4)
var answer = 0

for i in 0..<4 {
    let I = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<4 {
        let n = I[2 * j] - 1
        let d = I[2 * j + 1] - 1
        map[i][j] = n
        fish[n] = Fish(x: i, y: j, d: d)
    }
}

func dfs(_ map: [[Int]], _ fish: [Fish], _ shark: (Int, Int), _ sum: Int) {
    var map = map
    var fish = fish
    
    let num = map[shark.0][shark.1]
    let sD = fish[num].d
    fish[num].x = -1; fish[num].y = -1; fish[num].d = -1
    map[shark.0][shark.1] = -1
    
    let sum = sum + num + 1
    answer = max(answer, sum)
    
    for i in 0..<16 {
        guard fish[i].x != -1 else { continue }
        var (x, y, d) = (fish[i].x, fish[i].y, fish[i].d)
        
        for _ in 0..<8 {
            let nX = x + dx[d]
            let nY = y + dy[d]
            if nX < 0 || nY < 0 || nX >= 4 || nY >= 4 || (shark.0 == nX && shark.1 == nY) {
                d = (d + 1) % 8
                continue
            }
            
            if map[nX][nY] != -1 {
                fish[map[nX][nY]].x = x
                fish[map[nX][nY]].y = y
            }
            fish[i].x = nX
            fish[i].y = nY
            fish[i].d = d
            map[x][y] = map[nX][nY]
            map[nX][nY] = i
            break
        }
    }
    
    for i in 0..<4 {
        let (nX, nY) = (shark.0 + dx[sD] * i, shark.1 + dy[sD] * i)
        if nX < 0 || nY < 0 || nX >= 4 || nY >= 4 { break }
        if map[nX][nY] != -1 { dfs(map, fish, (nX, nY), sum) }
    }
}

dfs(map, fish, (0, 0), 0)
print(answer)
