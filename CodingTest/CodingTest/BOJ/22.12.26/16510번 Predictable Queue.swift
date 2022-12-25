//  백준 - Predictable Queue
//  https://www.acmicpc.net/problem/16510
//  Created by 홍은표 on 2022/12/26.

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
var arr = [Int]()
for _ in 0..<N { arr.append((arr.last ?? 0) + readInt()) }

func binarySearch(_ find: Int) -> Int {
    var start = 0, end = arr.count
    var result = 0
    while start < end {
        let mid = (start + end) / 2
        if arr[mid] <= find {
            start = mid + 1
            result = mid
        } else {
            end = mid
        }
    }
    if arr[result] > find { result -= 1 }
    return result + 1
}
var answer = ""
for _ in 0..<M { answer.write("\(binarySearch(readInt()))\n") }
print(answer)
