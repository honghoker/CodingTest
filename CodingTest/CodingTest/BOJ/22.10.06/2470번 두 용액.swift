//  백준 - 두 용액
//  https://www.acmicpc.net/problem/2470
//  Created by 홍은표 on 2022/10/06.

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
for _ in 0..<N {
    arr.append(readInt())
}
arr.sort()

var left = 0
var right = N - 1
var maxDiff = Int.max
var answer = (0, 0)

while left < right {
    let diff = arr[left] + arr[right]
    let absDiff = abs(diff)
    if maxDiff > absDiff {
        maxDiff = absDiff
        answer = (left, right)
        if maxDiff == 0 { break }
    }
    if diff > 0 { right -= 1 }
    else { left += 1 }
}

print(arr[answer.0], arr[answer.1])
