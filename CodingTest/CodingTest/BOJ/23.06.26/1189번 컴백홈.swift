//  백준 - 컴백홈
//  https://www.acmicpc.net/problem/1189
//  Created by 홍은표 on 2023/06/26.

import Foundation

let I = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C, K) = (I[0], I[1], I[2])
let map = (0..<R).map { _ in readLine()!.map { String($0) } }
let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
var visit = Array(repeating: Array(repeating: false, count: C), count: R)
visit[R-1][0] = true
func dfs(_ x: Int, _ y: Int, _ count: Int) -> Int {
    if x == 0 && y == C-1 {
        if count == K { return 1 }
        else { return 0 }
    }
    var sum = 0
    for i in 0...3 {
        let (nX, nY) = (x + dx[i], y + dy[i])
        if nX < 0 || nY < 0 || nX >= R || nY >= C || map[nX][nY] == "T" || visit[nX][nY] { continue }
        visit[nX][nY] = true
        sum += dfs(nX, nY, count + 1)
        visit[nX][nY] = false
    }
    return sum
}
print(dfs(R-1, 0, 1))
