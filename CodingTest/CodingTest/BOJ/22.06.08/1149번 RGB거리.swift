//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/09.
//

import Foundation

let N = Int(readLine()!)!
var arr: [[Int]] = [[]]

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}

var dp = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)

for i in 1...N {
    dp[i][0] = arr[i][0] + min(dp[i-1][1], dp[i-1][2]) // 현재 red + min(green, blue)
    dp[i][1] = arr[i][1] + min(dp[i-1][0], dp[i-1][2]) // 현재 green + min(red, blue)
    dp[i][2] = arr[i][2] + min(dp[i-1][0], dp[i-1][1]) // 현재 blue + min(red, green)
}

print(min(dp[N][0], dp[N][1], dp[N][2]))
