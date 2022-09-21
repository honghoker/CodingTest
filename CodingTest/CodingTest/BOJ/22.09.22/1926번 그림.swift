//  백준 - 그림
//  https://www.acmicpc.net/problem/1926
//  Created by 홍은표 on 2022/09/19.

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var map = [[Int]]()

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0 , 0]

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var visit = Array(repeating: Array(repeating: false, count: M), count: N)
var count = 0
var maxArea = 0

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 1 && !visit[i][j] {
            var queue = [(i, j)]
            var front = 0
            var nowArea = 1
            visit[i][j] = true
            count += 1
            
            while front < queue.count {
                let node = queue[front]
                front += 1
                
                for i in 0...3 {
                    let nX = node.0 + dx[i]
                    let nY = node.1 + dy[i]
                    
                    if nX < 0 || nY < 0 || nX >= N || nY >= M || map[nX][nY] == 0 {
                        continue
                    }
                    
                    if !visit[nX][nY] {
                        queue.append((nX, nY))
                        nowArea += 1
                        visit[nX][nY] = true
                    }
                }
            }
            maxArea = max(maxArea, nowArea)
        }
    }
}

print(count)
print(maxArea)
