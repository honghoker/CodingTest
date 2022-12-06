//  백준 - 전깃줄 - 2
//  https://www.acmicpc.net/problem/2568
//  Created by 홍은표 on 2022/12/06.

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

for _ in 0..<N {
    map[readInt()] = readInt()
}

var dp = [Int]()
var bf = Array(repeating: 0, count: N)

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if numbers[mid] < find { start = mid + 1 }
        else { end = mid }
    }
    return end
}

let sortedMap = map.sorted { $0.key < $1.key }
dp.append(sortedMap[0].value)
for i in 1..<sortedMap.count {
    let value = sortedMap[i].value
    let index = lowerBound(value, dp)
    if dp.count == index {
        dp.append(value)
    } else {
        dp[index] = value
    }
    bf[i] = index
}

var tmp = dp.count - 1
var answer = [Int]()
for i in stride(from: bf.count-1, through: 0, by: -1) {
    if tmp == bf[i] {
        tmp -= 1
    } else {
        answer.append(sortedMap[i].key)
    }
}

print(N - dp.count)
print(answer.reversed().map { String($0) }.joined(separator: "\n"))
