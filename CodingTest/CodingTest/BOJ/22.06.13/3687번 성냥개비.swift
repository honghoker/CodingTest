//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/13.
//

import Foundation

var arr = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]

// 두번째 자리부터 만들 수 있는 가장 작은 수
var minNumArr = [0, 0, 1, 7, 4, 2, 0, 8, 10]
var dp = Array(repeating: Int.max, count: 101)
dp[2] = 1; dp[3] = 7; dp[4] = 4; dp[5] = 2; dp[6] = 6; dp[7] = 8; dp[8] = 10

for i in 9...100 {
    for j in 2...7 { // minNumArr count
        dp[i] = min(dp[i], dp[i-j] * 10 + minNumArr[j])
    }
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    var maxNum = ""

    if n % 2 == 1 {
        maxNum = "7"
        for _ in 0..<(n - 3) / 2 {
            maxNum += "1"
        }
    } else {
        for _ in 0..<n / 2 {
            maxNum += "1"
        }
    }
    print(dp[n], maxNum)
}
