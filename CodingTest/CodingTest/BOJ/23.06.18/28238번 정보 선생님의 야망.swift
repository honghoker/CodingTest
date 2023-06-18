//  백준 - 정보 선생님의 야망
//  https://www.acmicpc.net/problem/28238
//  Created by 홍은표 on 2023/06/18.

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
let arr = (0..<N).map { _ in (0..<5).map { _ in readInt() } }
var answer = 0, x = 0, y = 0

for i in 0..<5 {
    for j in (i+1)..<5 {
        var count = 0
        for k in 0..<N where (arr[k][i] & arr[k][j]) != 0 {
            count += 1
        }
        if answer <= count {
            x = i; y = j; answer = count
        }
    }
}

print("\(answer)\n\((0..<5).map { $0 == x || $0 == y ? "1" : "0" }.joined(separator: " "))")
