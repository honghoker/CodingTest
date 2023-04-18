//  백준 - 사사의 사차원 사탕 봉지
//  https://www.acmicpc.net/problem/27968
//  Created by 홍은표 on 2023/04/16.

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
var total = [Int64]()
(1...M).forEach { _ in total.append((total.last ?? 0) + Int64(readInt())) }

func binarySearch(_ want: Int64, _ total: [Int64]) -> Int {
    var left = 0
    var right = total.count - 1
    var result = -1

    while left <= right {
        let mid = (left + right) / 2
        if total[mid] >= want {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return result
}

var answer = ""
(1...N).forEach { _ in
    let want = Int64(readInt())
    if total.last! < want { answer.write("Go away!\n") }
    else {
        let index = binarySearch(want, total)
        answer.write("\(index + 1)\n")
    }
}
print(answer)
