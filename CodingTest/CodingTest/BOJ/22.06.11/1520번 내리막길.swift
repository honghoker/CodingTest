//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/11.
//

import Foundation

// M 세로, N 가로

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (input[0], input[1])

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

var map : [[Int]] = Array(repeating: [], count: M + 1)
map[0] = Array(repeating: 0, count: N + 1)
for i in 1...M {
    map[i] = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
}

var dp = Array(repeating: Array(repeating: -1, count: N + 1), count: M + 1)

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == M && y == N {
        return 1
    }
    
    if dp[x][y] == -1 {
        dp[x][y] = 0
        for i in 0...3 {
            let nX = x + dy[i]
            let nY = y + dx[i]

            if nX < 1 || nY < 1 || nX > M || nY > N {
                continue
            } else {
                if map[x][y] > map[nX][nY] {
                    dp[x][y] += dfs(nX, nY)
                }
            }
        }
    }
    return dp[x][y]
}


print(dfs(1, 1))
