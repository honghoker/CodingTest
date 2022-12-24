//  백준 - ACM Craft
//  https://www.acmicpc.net/problem/1005
//  Created by 홍은표 on 2022/12/24.

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
for _ in 0..<readInt() {
    let (N, K) = (readInt(), readInt())
    var nodes = Array(repeating: [Int](), count: N+1)
    var inDegree = Array(repeating: 0, count: N+1)
    var D = [0]
    for _ in 0..<N { D.append(readInt()) }
    for _ in 0..<K {
        let (u, v) = (readInt(), readInt())
        nodes[u].append(v)
        inDegree[v] += 1
    }
    let W = readInt()

    var queue = [Int]()
    var front = 0
    var dp = Array(repeating: 0, count: N+1)
    for i in 1...N where inDegree[i] == 0 { queue.append(i); dp[i] = D[i] }
    while front < queue.count {
        let node = queue[front]
        front += 1
        for next in nodes[node] {
            dp[next] = max(dp[next], dp[node] + D[next])
            inDegree[next] -= 1
            if inDegree[next] == 0 { queue.append(next); }
        }
    }
    answer.write("\(dp[W])\n")
}

print(answer)
