//  백준 - 동전 2
//  https://www.acmicpc.net/problem/2294
//  Created by 홍은표 on 2022/10/08.

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])

var coins = [Int]()
var dp = Array(repeating: Int.max, count: k+1)
dp[0] = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
    if coins.last! <= k { dp[coins.last!] = 1 }
}

for coin in coins {
    if coin > k { continue }
    
    for i in coin...k {
        if dp[i - coin] != Int.max && dp[i] > dp[i - coin] + 1 {
            dp[i] = dp[i - coin] + 1
        }
    }
}

print(dp[k] == Int.max ? -1 : dp[k])
