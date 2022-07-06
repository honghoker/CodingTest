//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/05.
//

import Foundation

let N = Int(readLine()!)!

var map = [[Int]]()
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var dp = Array(repeating: Array(repeating: (0, 0, 0), count: N), count: N)
dp[0][1].0 = 1

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 || (i == 0 && j == 1) {
            continue
        }
        if i > 0 { // 세로
            dp[i][j].1 = dp[i-1][j].1 + dp[i-1][j].2
        }
        if j > 0 { // 가로
            dp[i][j].0 = dp[i][j-1].0 + dp[i][j-1].2
        }
        if i > 0 && j > 0 && map[i-1][j] == 0 && map[i][j-1] == 0 { // 대각선
            dp[i][j].2 = dp[i-1][j-1].0 + dp[i-1][j-1].1 + dp[i-1][j-1].2
        }
    }
}

print(dp.last!.last!.0 + dp.last!.last!.1 + dp.last!.last!.2)


// 가로 세로 대각선
//let dx = [0, 1, 1]
//let dy = [1, 0, 1]

//var answer = 0

//func dfs(_ x: Int, _ y: Int, _ d: Int) {
//    if x == N - 1 && y == N - 1 {
//        answer += 1
//        return
//    }
//
//    for i in 0...2 {
//        if (d == 0 && i == 1) || (d == 1 && i == 0) { continue }
//        let nX = x + dx[i]
//        let nY = y + dy[i]
//        if nX < 0 || nX >= N || nY < 0 || nY >= N || map[nX][nY] == 1 {
//            continue
//        }
//        if i == 2 && (map[x+1][y] == 1 || map[x][y+1] == 1) {
//            continue
//        }
//        dfs(nX, nY, i)
//    }
//}

//dfs(0, 1, 0)
//print(answer)
