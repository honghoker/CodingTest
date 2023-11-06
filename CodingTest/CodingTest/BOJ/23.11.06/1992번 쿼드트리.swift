//  백준 - 쿼드트리
//  https://www.acmicpc.net/problem/1992
//  Created by 홍은표 on 23/11/6.

let N = Int(readLine()!)!, A = (0..<N).map { _ in readLine()!.map { String($0) } }
func isQuad(_ x: Int, _ y: Int, _ s: Int) -> Bool { (x..<x + s).allSatisfy { i in (y..<y + s).allSatisfy { j in A[i][j] == A[x][y] } } }
func dfs(_ x: Int, _ y: Int, _ s: Int) -> String {
    if isQuad(x, y, s) { return A[x][y] }
    let s = s / 2
    return "(" + dfs(x, y, s) + dfs(x, y + s, s) + dfs(x + s, y, s) + dfs(x + s, y + s, s) + ")"
}
print(dfs(0, 0, N))
