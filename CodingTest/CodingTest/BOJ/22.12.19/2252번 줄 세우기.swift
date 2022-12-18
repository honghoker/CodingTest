//  백준 - 줄 세우기
//  https://www.acmicpc.net/problem/2252
//  Created by 홍은표 on 2022/12/19.

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

let (N, M) = (readInt(), readInt())
var nodes = Array(repeating: [Int](), count: N+1)
var inDegree = Array(repeating: 0, count: N+1)

for _ in 0..<M {
    let (A, B) = (readInt(), readInt())
    nodes[A].append(B)
    inDegree[B] += 1
}

var queue = [Int]()
for i in 1...N where inDegree[i] == 0 {
    queue.append(i)
}

var front = 0
var answer = ""
while front < queue.count {
    let node = queue[front]
    front += 1
    answer.write("\(node) ")
    for next in nodes[node] {
        inDegree[next] -= 1
        if inDegree[next] == 0 { queue.append(next) }
    }
}

print(answer)
