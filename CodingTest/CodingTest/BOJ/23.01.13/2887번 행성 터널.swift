//  백준 - 행성 터널
//  https://www.acmicpc.net/problem/2887
//  Created by 홍은표 on 2023/01/13.

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
var parent = Array(repeating: 0, count: N)
var nodes = Array(repeating: [(Int, Int)](), count: 3)
var dists = [(Int, Int, Int)]()

func find(_ u: Int) -> Int {
    if parent[u] == u { return u }
    else {
        parent[u] = find(parent[u])
        return parent[u]
    }
}

func make_union(_ u: Int, _ v: Int) {
    if u < v { parent[v] = u }
    else if u > v { parent[u] = v }
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

for i in 0..<N {
    for j in 0..<3 { nodes[j].append((i, readInt())) }
    parent[i] = i
}
for i in 0..<3 { nodes[i].sort(by: { $0.1 < $1.1 }) }

for i in 0..<N - 1 {
    for j in 0..<3 {
        dists.append((nodes[j][i].0, nodes[j][i+1].0, abs(nodes[j][i].1 - nodes[j][i+1].1)))
    }
}
dists.sort(by: { $0.2 < $1.2 })

var answer = 0, count = 0
for dist in dists {
    if count == N - 1 { break }
    if !union_find(dist.0, dist.1) { answer += dist.2; count += 1 }
}

print(answer)
