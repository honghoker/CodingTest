//  백준 - 가장 큰 정사각형
//  https://www.acmicpc.net/problem/1915
//  Created by 홍은표 on 23/10/09.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var A = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: NM[1]), count: NM[0])
var r = 0
for _ in 0..<NM[0] { A.append(readLine()!.map { Int(String($0))! }) }
for i in 0..<NM[0] {
    for j in 0..<NM[1] where A[i][j] == 1 {
        if i == 0 || j == 0 { dp[i][j] = 1 } 
        else { dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 }
        r = max(r, dp[i][j])
    }
}
print(r * r)
