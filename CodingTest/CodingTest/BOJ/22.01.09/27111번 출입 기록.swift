//  백준 - 출입 기록
//  https://www.acmicpc.net/problem/27111
//  Created by 홍은표 on 2023/01/09.

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
var visit = Set<Int>()
var answer = 0

for _ in 0..<N {
    let (a, b) = (readInt(), readInt())
    if b == 1 {
        if visit.contains(a) { answer += 1 }
        visit.insert(a)
    } else {
        if !visit.contains(a) { answer += 1 }
        visit.remove(a)
    }
}

print(answer + visit.count)
