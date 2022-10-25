//  백준 - 오르막 수
//  https://www.acmicpc.net/problem/11057
//  Created by 홍은표 on 2022/10/25.

import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 1, count: 10), count: N)

for i in 1..<N {
    for j in 1...9 {
        dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 10007
    }
}

print(dp[N-1].reduce(0, +) % 10007)
