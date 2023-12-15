//  백준 - 핑크 플로이드
//  https://www.acmicpc.net/problem/6091
//  Created by 홍은표 on 23/12/15.

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

let N = readInt()
var edges = [(Int, Int, Int)]()
var parent = [Int](0...N)
var graph = [[Int]](repeating: [], count: N+1)

for i in 1..<N {
    for j in i+1...N {
        edges.append((readInt(), i, j))
    }
}
edges.sort(by: { $0.0 < $1.0 })

func find(_ u: Int) -> Int {
    if parent[u] != u { parent[u] = find(parent[u]) }
    return parent[u]
}

func merge(_ u: Int, _ v: Int) -> Bool {
    let u = find(u), v = find(v)
    if u == v { return false }
    if u > v { parent[u] = v }
    else { parent[v] = u }
    return true
}

var edge = N-1
for (_, u, v) in edges {
    if merge(u, v) {
        graph[u].append(v)
        graph[v].append(u)
        edge -= 1
    }
    if edge == 0 { break }
}

var a = ""
for i in 1...N {
    a += "\(graph[i].count) \(graph[i].sorted().map { String($0) }.joined(separator: " "))\n"
}
print(a)
