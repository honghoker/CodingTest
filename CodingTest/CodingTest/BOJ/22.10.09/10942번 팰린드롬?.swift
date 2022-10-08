//  백준 - 팰린드롬?
//  https://www.acmicpc.net/problem/10942
//  Created by 홍은표 on 2022/10/09.

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

let N = readInt()
var arr = [-1]
for _ in 0..<N {
    arr.append(readInt())
}

let M = readInt()
var dp = Array(repeating: Array(repeating: false, count: N+1), count: N+1)

for i in 1...N {
    dp[i][i] = true // 자기자신은 팰린드롬
    if i + 1 <= N && arr[i] == arr[i + 1] { // 그 다음과 같다면 팰린드롬
        dp[i][i + 1] = true
    }
}

for i in stride(from: N-2, through: 1, by: -1) {
    for j in i+2...N {
        if dp[i + 1][j - 1] && arr[i] == arr[j] {
            dp[i][j] = true
        }
    }
}

var answer = ""
for _ in 0..<M {
    let (S, E) = (readInt(), readInt())
    answer += dp[S][E] ? "1\n" : "0\n"
}

print(answer)
