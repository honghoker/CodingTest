//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/12.
//

import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[i] = [0] + input
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var dp = Array(repeating: Array(repeating: -1, count: N + 1), count: N + 1)

func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] != -1 { return dp[x][y] }
    
    dp[x][y] = 1
    
    for i in 0...3 {
        let nX = x + dx[i]
        let nY = y + dy[i]
        
        if nX < 1 || nY < 1 || nX > N || nY > N {
            continue
        } else {
            if map[x][y] < map[nX][nY] {
                dp[x][y] = max(dp[x][y], dfs(nX, nY) + 1)
            }
        }
    }
    return dp[x][y]
}

var answer = 0

for i in 1...N {
    for j in 1...N {
        answer = max(answer, dfs(i, j))
    }
}

print(answer)
