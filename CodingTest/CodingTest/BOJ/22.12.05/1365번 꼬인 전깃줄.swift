//  백준 - 꼬인 전깃줄
//  https://www.acmicpc.net/problem/1365
//  Created by 홍은표 on 2022/12/05.

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
for _ in 0..<N { arr.append(readInt()) }
var dp = [arr[0]]

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if find > numbers[mid] { start = mid + 1 } else { end = mid }
    }
    return end
}

for i in 1..<N {
    let index = lowerBound(arr[i], dp)
    if dp.count == index { dp.append(arr[i]) }
    else { dp[index] = arr[i] }
}

print(N - dp.count)
