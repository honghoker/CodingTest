//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/10.
//

import Foundation

// N : 물건의 수, K : 무게
// 0 : 무게, 1 : 가치

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var value = [(Int, Int)]()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    value.append((input[0], input[1]))
}

var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N)

for i in 0..<N {
    for j in 1...K {
        if i == 0 { // 첫번재 줄이면,
            if j >= value[i].0 {
                dp[i][j] = value[i].1
            }
        } else {
            if j < value[i].0 {
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = max(dp[i-1][j], value[i].1 + dp[i-1][j-value[i].0])
            }
        }
    }
}

print(dp[N-1][K])
