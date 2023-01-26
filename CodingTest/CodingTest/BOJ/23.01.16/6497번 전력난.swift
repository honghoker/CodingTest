//  백준 - 전력난
//  https://www.acmicpc.net/problem/6497
//  Created by 홍은표 on 2023/01/16.

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

var answer = ""
while true {
    let (m, n) = (readInt(), readInt())
    if m == 0 && n == 0 { break }
    
    var parent = [Int]()
    var nodes = [(Int, Int, Int)]()
    
    for i in 0..<n {
        let (x, y, z) = (readInt(), readInt(), readInt())
        nodes.append((x, y, z))
        parent.append(i)
    }

    nodes.sort(by: { $0.2 < $1.2 })

    func find(_ u: Int) -> Int {
        if parent[u] != u { parent[u] = find(parent[u]) }
        return parent[u]
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
        else { parent[v] = u }
    }

    var result = 0
    for node in nodes {
        if union_find(node.0, node.1) { result += node.2 }
    }

    answer.write("\(result)\n")
}
    
print(answer)
