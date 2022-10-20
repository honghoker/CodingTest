//  백준 - 공통 부분 문자열
//  https://www.acmicpc.net/problem/5582
//  Created by 홍은표 on 2022/10/21.

import Foundation

let S = readLine()!.map { String($0) }
let T = readLine()!.map { String($0) }

var dp = Array(repeating: Array(repeating: 0, count: T.count + 1), count: S.count + 1)

var answer = 0

for i in 1...S.count {
    for j in 1...T.count {
        if S[i-1] == T[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
            answer = max(answer, dp[i][j])
        }
    }
}

print(answer)
