//  백준 - 오큰수
//  https://www.acmicpc.net/problem/17298
//  Created by 홍은표 on 2022/12/14.

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
var arr = [Int]()
var stack = [Int]()

for i in 0..<N {
    arr.append(readInt())
    while !stack.isEmpty && arr[stack.last!] < arr[i] {
        arr[stack.removeLast()] = arr[i]
    }
    stack.append(i)
}
for index in stack {
    arr[index] = -1
}

print(arr.map { String($0) }.joined(separator: " "))
