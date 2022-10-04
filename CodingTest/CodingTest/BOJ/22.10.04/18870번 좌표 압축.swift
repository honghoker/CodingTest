//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/10/04.
//

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
var map = [Int: Int]()
var arr = [Int]()
for _ in 0..<N {
    arr.append(readInt())
}

let tempArr = Set(arr).sorted()

for i in 0..<tempArr.count {
    if map[tempArr[i]] == nil {
        map[tempArr[i]] = i
    }
}

var answer = ""
for i in 0..<N {
    answer.append("\(map[arr[i]]!) ")
}

print(answer)
