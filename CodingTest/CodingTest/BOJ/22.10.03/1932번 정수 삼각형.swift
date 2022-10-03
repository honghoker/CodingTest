//  백준 - 정수 삼각형
//  https://www.acmicpc.net/problem/1932
//  Created by 홍은표 on 2022/10/03.

import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: N), count: N)

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dp[0][0] = arr[0][0]

for i in 1..<N {
    for j in 0..<arr[i].count {
        if j == 0 {
            dp[i][j] = dp[i-1][j] + arr[i][j]
        } else if j < arr[i].count - 1{
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-1]) + arr[i][j]
        } else if j == arr[i].count - 1{
            dp[i][j] = dp[i-1][j-1] + arr[i][j]
        }
    }
}

print(dp[N-1].max()!)
