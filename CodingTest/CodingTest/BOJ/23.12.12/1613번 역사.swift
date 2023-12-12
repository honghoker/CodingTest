//  백준 - 역사
//  https://www.acmicpc.net/problem/1613
//  Created by 홍은표 on 23/12/12.

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

let (N, K) = (readInt(), readInt())
var A = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: N)
for _ in 0..<K {
    let (a, b) = (readInt()-1, readInt()-1)
    A[a][b] = -1
    A[b][a] = 1
}

for k in 0..<N {
    for i in 0..<N {
        for j in 0..<N where A[i][k] != Int.max && A[k][j] != Int.max {
            if A[i][k] == 1 && A[k][j] == 1 {
                A[i][j] = 1
            } else if A[i][k] == -1 && A[k][j] == -1 {
                A[i][j] = -1
            }
        }
    }
}
var r = ""
for _ in 0..<readInt() {
    let (a, b) = (readInt()-1, readInt()-1)
    r += "\(A[a][b] == Int.max ? 0 : A[a][b])\n"
}
print(r)
