//  백준 - 연결요소의 개수
//  https://www.acmicpc.net/problem/11724
//  Created by 홍은표 on 2022/06/12.

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
var arr: [[Int]] = Array(repeating: [], count: N + 1)
var visit = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let (u, v) = (readInt(), readInt())
    arr[u].append(v)
    arr[v].append(u)
}

var answer = 0

func dfs(_ now: Int) {
    visit[now] = true
    for i in 0..<arr[now].count {
        let next = arr[now][i]
        if visit[next] == false { dfs(next) }
    }
}

for i in 1...N {
    if visit[i] == false {
        answer += 1
        dfs(i)
    }
}

print(answer)
