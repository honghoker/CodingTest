//  백준 - 수 찾기
//  https://www.acmicpc.net/problem/1920
//  Created by 홍은표 on 2023/05/26.

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

var A = Set<Int>()
var answer = ""
for _ in 0..<readInt() { A.insert(readInt()) }
for _ in 0..<readInt() { answer.write((A.contains(readInt()) ? "1" : "0") + "\n") }
print(answer)
