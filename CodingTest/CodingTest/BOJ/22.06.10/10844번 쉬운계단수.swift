//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/10.
//

import Foundation

// 현재 N에서, 0을 맨 뒷자리로 가지려면, N-1의 끝자리 1인 경우들이 와야한다.
// dp[N][0] = dp[N-1][1]
// 현재 N에서, 9를 맨 끝자리로 가지려면, N-1의 끝자리 8인 경우이다.
// dp[N][9] = dp[N-1][8]
// 현재 N에서, 1,2,3,4,5,6,7,8 을 맨 끝자리로 가지려면 N-1에서 앞뒤 숫자를 하나씩 가져와야한다. (총 2개)
// dp[N][j] = dp[N-1][j-1] + dp[N-1][j+1]

let n = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
let mod = 1000000000
var sum = 0

for i in 0...9 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][0] = dp[i-1][1] % mod
            } else if j == 9 {
                dp[i][9] = dp[i-1][8] % mod
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % mod
            }
        }
    }
}

for i in 1...9 {
    sum = (sum + dp[n][i]) % mod
}

print(sum % mod)
