//  백준 - 첨탑 밀어서 부수기
//  https://www.acmicpc.net/problem/28014
//  Created by 홍은표 on 2023/05/06.

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

var answer = 0, current = 0
for _ in 0..<readInt() {
    let tower = readInt()
    if current <= tower { answer += 1 }
    current = tower
}

print(answer)
