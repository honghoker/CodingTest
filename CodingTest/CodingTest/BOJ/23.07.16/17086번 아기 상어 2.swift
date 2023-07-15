//  백준 - 아기 상어 2
//  https://www.acmicpc.net/problem/17086
//  Created by 홍은표 on 2023/07/16.

let I = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (I[0], I[1])
let dx = [0, 0, 1, -1, 1, -1, 1, -1], dy = [1, -1, 0, 0, 1, -1, -1, 1]
var map = [[Int]](), S = [(Int,Int)]()
for i in 0..<N {
    let L = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in L.indices where L[j] == 1 { S.append((i, j)) }
    map.append(L)
}

func bfs() {
    var q = S, f = 0
    while f < q.count {
        let (x, y) = q[f]; f += 1
        for i in 0...7 {
            let (nX, nY) = (x + dx[i], y + dy[i])
            if nX < 0 || nY < 0 || nX >= N || nY >= M || map[nX][nY] != 0 { continue }
            map[nX][nY] = map[x][y] + 1
            q.append((nX, nY))
        }
    }
}
bfs()
var a = 0
for i in 0..<N {
    for j in 0..<M {
        a = max(a, map[i][j]-1)
    }
}
print(a)
