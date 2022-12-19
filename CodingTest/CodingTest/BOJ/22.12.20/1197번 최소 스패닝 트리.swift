//  백준 - 최소 스패닝 트리
//  https://www.acmicpc.net/problem/1197
//  Created by 홍은표 on 2022/12/20.

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

let (V, E) = (readInt(), readInt())
var answer = 0
var parent = [-1]
var nodes = [(Int, Int, Int)]()

func find(_ u: Int) -> Int {
    if parent[u] == u { return u }
    else {
        parent[u] = find(parent[u])
        return parent[u]
    }
}

func union_find(_ u: Int, _ v: Int) -> Bool {
    let u = find(u)
    let v = find(v)
    if u == v { return true }
    else {
        make_union(u, v)
        return false
    }
}

func make_union(_ u: Int, _ v: Int) {
    if u > v { parent[u] = v }
    else if u < v { parent[v] = u }
}

for i in 1...V { parent.append(i) }
for _ in 0..<E { nodes.append((readInt(), readInt(), readInt())) }
nodes.sort(by: { $0.2 < $1.2 })

for i in 0..<E {
    let (u, v, cost) = nodes[i]
    if !union_find(u, v) { answer += cost }
}

print(answer)
