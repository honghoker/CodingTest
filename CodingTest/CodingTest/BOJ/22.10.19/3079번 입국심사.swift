//  백준 - 입국심사
//  https://www.acmicpc.net/problem/3079
//  Created by 홍은표 on 2022/10/19.

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

var times = [Int]()
var maxTime = 0

for _ in 0..<N {
    times.append(readInt())
    maxTime = max(maxTime, times.last!)
}

var left = 0, right = M * maxTime
var answer = 0

while left <= right {
    let mid = (left + right) / 2
    var sum = 0
    
    for i in 0..<N {
        sum += mid / times[i]
    }
    if sum < M {
        left = mid + 1
    } else {
        answer = mid
        right = mid - 1
    }
}
print(answer)
