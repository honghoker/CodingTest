//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/29.
//

import Foundation


// 14501번 퇴사
struct cost {
    let T: Int
    let P: Int
}

let N = Int(readLine()!)!
var arr = Array(repeating: cost(T: 0, P: 0), count: N+1)
var dp = Array(repeating: 0, count: 1001)

for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let T = input[0]
    let P = input[1]
    dp[i] = P
    arr[i] = cost(T: T, P: P)
}

for i in stride(from: N, through: 1, by: -1) {
    if i + arr[i].T <= N+1 {
        // 회사에 있음
        dp[i] = max(dp[i+1], dp[i + arr[i].T] + arr[i].P)
    } else {
        // 회사에 없음
        dp[i] = dp[i+1]
    }
}

print(dp.max()!)
