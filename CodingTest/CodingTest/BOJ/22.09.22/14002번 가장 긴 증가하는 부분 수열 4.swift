//  백준 - 가장 긴 증가하는 부분 수열 4
//  https://www.acmicpc.net/problem/14002
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
var bf = Array(repeating: 0, count: N)

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    
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

dp.append(A[0])

for i in 1..<N {
    let index = lowerBound(A[i], dp)
    if dp.count == index {
        dp.append(A[i])
    } else {
        dp[index] = A[i]
    }
    bf[i] = index
}

var tmp = dp.count - 1
var answer = [Int]()
for i in 0..<N {
    if bf[N-1-i] == tmp {
        answer.append(A[N-1-i])
        tmp -= 1
    }
}

print(dp.count)
print(answer.reversed().map { String($0) }.joined(separator: " "))
