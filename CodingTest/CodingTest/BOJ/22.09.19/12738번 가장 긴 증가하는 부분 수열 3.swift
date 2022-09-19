//  백준 - 가장 긴 증가하는 부분 수열 3
//  https://www.acmicpc.net/problem/12738
//  Created by 홍은표 on 2022/09/19.


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
var A = [Int]()
for _ in 0..<N {
    A.append(readInt())
}
var dp = [Int]()

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        if numbers[mid] < find {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

for i in 0..<N {
    if dp.isEmpty {
        dp.append(A[i])
        continue
    }
    
    if dp[dp.count - 1] < A[i] {
        dp.append(A[i])
    } else {
        let index = lowerBound(A[i], dp)
        dp[index] = A[i]
    }
}

print(dp.count)
