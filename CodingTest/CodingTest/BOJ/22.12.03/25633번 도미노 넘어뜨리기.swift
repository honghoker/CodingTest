//  백준 - 도미노 넘어뜨리기
//  https://www.acmicpc.net/problem/25633
//  Created by 홍은표 on 2022/12/03.

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: N)

var count = 0
for i in 0..<N {
    var sum = arr[i]
    count = 1
    for j in i+1..<N {
        if sum >= arr[j] {
            sum += arr[j]
            count += 1
            dp[j] = max(dp[j], count)
        }
    }
}

print(dp.max()!)
