//  백준 - 겹치는 건 싫어
//  https://www.acmicpc.net/problem/20922
//  Created by 홍은표 on 2022/10/31.

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

let NK = [readInt(), readInt()]
var arr = [Int]()
for _ in 0..<NK[0] { arr.append(readInt()) }
var answer = -1, left = 0, right = 0
var visit = [Int: Int]()

while right < NK[0] {
    if visit[arr[right], default: 0] == NK[1] {
        visit[arr[left], default: 0] -= 1
        left += 1
    } else {
        answer = max(answer, right - left + 1)
        visit[arr[right], default: 0] += 1
        right += 1
    }
}
print(answer)
