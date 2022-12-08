//  백준 - 주식
//  https://www.acmicpc.net/problem/11501
//  Created by 홍은표 on 2022/12/08.

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
    let N = readInt()
    var arr = [Int]()
    for _ in 0..<N { arr.append(readInt()) }
    var result = 0
    var maxVal = arr.last!

    for value in arr.reversed() {
        if value >= maxVal {
            maxVal = value
        } else {
            result += (maxVal - value)
        }
    }

    answer += "\(result)\n"
}

print(answer)
