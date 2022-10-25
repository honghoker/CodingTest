//  백준 - 동물원
//  https://www.acmicpc.net/problem/1309
//  Created by 홍은표 on 2022/10/25.

import Foundation

let N = Int(readLine()!)!
var answer = 0
var dp = Array(repeating: Array(repeating: 0, count: 3), count: N)

dp[0][0] = 1
dp[0][1] = 1
dp[0][2] = 1

for i in 1..<N {
    dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % 9901
    dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % 9901
    dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % 9901
}

print(dp[N-1].reduce(0, +) % 9901)
