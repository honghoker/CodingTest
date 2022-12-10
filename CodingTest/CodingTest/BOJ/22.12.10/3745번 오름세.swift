//  백준 - 오름세
//  https://www.acmicpc.net/problem/3745
//  Created by 홍은표 on 2022/12/10.

import Foundation

var answer = ""
var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    let bp = buffer.withUnsafeBufferPointer { $0[byteIdx] }
    if bp == 0 { print(answer); exit(0) }
    return bp
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if find > numbers[mid] { start = mid + 1 }
        else { end = mid }
    }
    return end
}

while true {
    let N = readInt()
    var arr = [Int]()
    for _ in 0..<N { arr.append(readInt()) }
    var dp = [arr[0]]
    for i in 1..<N {
        let index = lowerBound(arr[i], dp)
        if dp.count == index { dp.append(arr[i]) }
        else { dp[index] = arr[i] }
    }
    answer += "\(dp.count)\n"
}
