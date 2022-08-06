//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/06.
//

import Foundation

let N = Int(readLine()!)!
var minDp = Array(repeating: Array(repeating: 0, count: 3), count: N)
var maxDp = Array(repeating: Array(repeating: 0, count: 3), count: N)

var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

minDp[0] = arr[0]
maxDp[0] = arr[0]

for i in 1..<N {
    minDp[i][0] = min(minDp[i-1][0], minDp[i-1][1]) + arr[i][0]
    minDp[i][1] = min(minDp[i-1][0], minDp[i-1][1], minDp[i-1][2]) + arr[i][1]
    minDp[i][2] = min(minDp[i-1][1], minDp[i-1][2]) + arr[i][2]
    
    maxDp[i][0] = max(maxDp[i-1][0], maxDp[i-1][1]) + arr[i][0]
    maxDp[i][1] = max(maxDp[i-1][0], maxDp[i-1][1], maxDp[i-1][2]) + arr[i][1]
    maxDp[i][2] = max(maxDp[i-1][1], maxDp[i-1][2]) + arr[i][2]
}

print(maxDp[N-1].max()!, minDp[N-1].min()!)
