//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/12.
//

import Foundation

let n = Int(readLine()!)!

var map = [[Int]]()
var dp = Array(repeating: Array(repeating: -1, count: n), count: n)

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var answer = 0

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] != -1 { return dp[x][y] }
    dp[x][y] = 1

    for i in 0...3 {
        let nX = x + dx[i]
        let nY = y + dy[i]
        
        if nX < 0 || nY < 0 || nX >= n || nY >= n {
            continue
        }
        
        if map[x][y] < map[nX][nY] {
            dp[x][y] = max(dfs(nX, nY) + 1, dp[x][y])
        }
    }
    
    return dp[x][y]
}

for i in 0..<n {
    for j in 0..<n {
        answer = max(answer, dfs(i, j))
    }
}

print(answer)
