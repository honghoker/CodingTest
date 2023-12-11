//  백준 - 택배
//  https://www.acmicpc.net/problem/1719
//  Created by 홍은표 on 23/12/11.

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
var A = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: N)
var R = [[String]](repeating: [String](repeating: "-", count: N), count: N)
for _ in 0..<M {
    let (a, b, c) = (readInt() - 1, readInt() - 1, readInt())
    A[a][b] = c; A[b][a] = c
    R[a][b] = "\(b + 1)"; R[b][a] = "\(a + 1)"
}
for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N where A[i][k] != Int.max && A[k][j] != Int.max {
            if i == j { A[i][j] = 0 }
            if A[i][j] > A[i][k] + A[k][j] {
                A[i][j] = A[i][k] + A[k][j]
                R[i][j] = "\(R[i][k])"
            }
        }
    }
}
print(R.map { $0.map { $0 }.joined(separator: " ") }.joined(separator: "\n"))
