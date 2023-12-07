//  백준 - 플로이드
//  https://www.acmicpc.net/problem/11404
//  Created by 홍은표 on 23/12/07.

import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), bIdx = 0; buffer.append(0)

@inline(__always) func read() -> UInt8 {
    defer { bIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[bIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = read(), isNegative = false
    while byte == 10 || byte == 32 { byte = read() }
    if byte == 45 { byte = read(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = read() }
    return number * (isNegative ? -1 : 1)
}

let (N, M) = (readInt(), readInt())
var A = Array(repeating: Array(repeating: Int.max, count: N), count: N)
for i in 0..<N { A[i][i] = 0 }
for _ in 0..<M {
    let (a, b, c) = (readInt()-1, readInt()-1, readInt())
    A[a][b] = min(A[a][b], c)
}

for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N where A[i][k] != Int.max && A[k][j] != Int.max && A[i][k] + A[k][j] < A[i][j] {
            A[i][j] = A[i][k] + A[k][j]
        }
    }
}
print(A.map { $0.map { String($0 == Int.max ? 0 : $0) }.joined(separator: " ") }.joined(separator: "\n"))
