//  백준 - 나무 자르기
//  https://www.acmicpc.net/problem/2805
//  Created by 홍은표 on 2023/06/04.

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

let (N, M) = (readInt(), readInt())
var woods = [Int]()
for _ in 0..<N { woods.append(readInt()) }
var answer = 0, start = 0, end = 1_000_000_001
while start < end {
    var sum = 0
    let mid = (start + end) / 2
    for wood in woods {
        if wood > mid {
            sum += wood - mid
            if sum >= M { break }
        }
    }
    if sum >= M {
        answer = max(answer, mid)
        start = mid + 1
    } else {
        end = mid
    }
}
print(answer)
