//  백준 - 스티커
//  https://www.acmicpc.net/problem/9465
//  Created by 홍은표 on 2022/10/03.

import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

let T = readInt()
for _ in 0..<T {
    let N = readInt()

    var arr = Array(repeating: Array(repeating: 0, count: N), count: 2)
    var dp = Array(repeating: Array(repeating: 0, count: N), count: 2)
    
    for i in 0..<2 {
        for j in 0..<N {
            arr[i][j] = readInt()
        }
    }
    
    if N == 1 {
        print(max(arr[0][0], arr[1][0]))
        continue
    }

    dp[0][0] = arr[0][0]
    dp[1][0] = arr[1][0]
    dp[0][1] = dp[1][0] + arr[0][1]
    dp[1][1] = dp[0][0] + arr[1][1]

    for i in 2..<N {
        dp[0][i] = max(dp[1][i-1], dp[1][i-2], dp[0][i-2]) + arr[0][i]
        dp[1][i] = max(dp[0][i-1], dp[0][i-2], dp[1][i-2]) + arr[1][i]
    }

    print(max(dp[0][N-1], dp[1][N-1]))
}
