//  백준 - 아기 상어
//  https://www.acmicpc.net/problem/16236
//  Created by 홍은표 on 2023/07/17.

let N = Int(readLine()!)!
let dx = [-1, 0, 1, 0], dy = [0, -1, 0, 1]
var map = [[Int]](), shark = (x: 0, y: 0, s: 2, e: 0)
for i in 0..<N {
    var S = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in S.indices where S[j] == 9 { shark.x = i; shark.y = j; S[j] = 0 }
    map.append(S)
}
var answer = 0
while true {
    var q = [(shark.x, shark.y, 0)], f = 0
    var eq = [(Int, Int, Int)]()
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    visit[shark.x][shark.y] = true
    
    while f < q.count {
        let (x, y, d) = q[f]; f += 1
        for i in 0..<4 {
            let (nX, nY) = (x + dx[i], y + dy[i])
            if nX < 0 || nY < 0 || nX >= N || nY >= N || visit[nX][nY] { continue }
            visit[nX][nY] = true
            if map[nX][nY] == 0 || map[nX][nY] == shark.s { q.append((nX, nY, d + 1)) }
            else if map[nX][nY] < shark.s { eq.append((nX, nY, d + 1)) }
        }
    }
    if eq.isEmpty { break }
    else {
        eq.sort {
            if $0.2 == $1.2 {
                if $0.0 == $1.0 {
                    return $0.1 < $1.1
                } else {
                    return $0.0 < $1.0
                }
            } else {
                return $0.2 < $1.2
            }
        }
        
        let fish = eq.first!
        map[fish.0][fish.1] = 0
        shark.e += 1
        if shark.e == shark.s {
            shark.s += 1
            shark.e = 0
        }
        shark.x = fish.0
        shark.y = fish.1
        answer += fish.2
    }
}
print(answer)
