//  백준 - 동전
//  https://www.acmicpc.net/problem/9084
//  Created by 홍은표 on 2022/10/25.

import Foundation

let T = Int(readLine()!)!
var answer = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int(String($0))! }
    let M = Int(readLine()!)!
    var dp = Array(repeating: 0, count: M+1)

    dp[0] = 1

    for i in 0..<N {
        if coins[i] <= M {
            for j in coins[i]...M {
                dp[j] += dp[j - coins[i]]
            }
        }
    }
    answer += "\(dp[M])\n"
}

print(answer)
