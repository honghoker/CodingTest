//  백준 - 금고 테스트
//  https://www.acmicpc.net/problem/2266
//  Created by 홍은표 on 23/11/21.

import Foundation

let I = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (I[0], I[1])
var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: K+1)

for i in 1...K {
    for j in 1...N {
        if i == 1 {
            dp[i][j] = j; continue
        }
        if i > j {
            dp[i][j] = dp[i-1][j]; continue
        }
        dp[i][j] = Int.max
        for k in 1...j {
            dp[i][j] = min(dp[i][j], max(dp[i-1][k-1], dp[i][j-k]) + 1)
        }
    }
}
print(dp[K][N])
