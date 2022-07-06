//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/06.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])

var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: 10001)
dp[0] = 1

for coin in coins {
    // coin이 k보다 클 때 예외처리
    if coin > k {
        continue
    }
    
    for i in coin...k {
        // 경우의 수가 2^31 벗어나는 경우 에외처리
        if dp[i] + dp[i - coin] > Int(pow(2.0, 31.0)) {
            dp[i] = 0
        } else {
            dp[i] = dp[i] + dp[i - coin]
        }
    }
}
print(dp[k])
