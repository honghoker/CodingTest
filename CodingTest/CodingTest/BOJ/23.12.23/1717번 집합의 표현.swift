//  백준 - 집합의 표현
//  https://www.acmicpc.net/problem/1717
//  Created by 홍은표 on 23/12/23.

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
var p = Array(0...N)

func find(_ u: Int) -> Int {
    if u != p[u] { p[u] = find(p[u]) }
    return p[u]
}

func merge(_ u: Int, _ v: Int) {
    let u = find(u), v = find(v)
    if u < v { p[u] = v }
    else if u > v { p[v] = u }
}

func isUnion(_ u: Int, _ v: Int) -> Bool {
    find(u) == find(v)
}
var r = ""
for _ in 0..<M {
    let (o, a, b) = (readInt(), readInt(), readInt())
    if o == 1 { r += (isUnion(a, b) ? "YES" : "NO") + "\n" }
    else { merge(a, b) }
}
print(r)
