//
//  ㅁㅁㅁ.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/24.
//

import Foundation

let n = Int(readLine()!)!
var card = [Int]()
var dp = Array(repeating: 0, count: 10001)

card.append(0)
card += readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 1...n {
    for j in 1...i {
        dp[i] = max(dp[i], dp[i-j] + card[j])
    }
}

print(dp[n])
