//  백준 - RGB거리 2
//  https://www.acmicpc.net/problem/17404
//  Created by 홍은표 on 2022/11/27.

import Foundation

let N = Int(readLine()!)!
var arr: [[Int]] = [[]]
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var answer = Int.max

for now in 0..<3 {
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)
    
    for i in 0..<3 {
        if i == now { dp[1][now] = arr[1][now] }
        else { dp[1][i] = Int(1e6) + 1}
    }
    
    for i in 2...N {
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + arr[i][0]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + arr[i][1]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + arr[i][2]
    }

    for i in 0..<3 {
        if i == now { continue }
        answer = min(answer, dp[N][i])
    }
}

print(answer)
