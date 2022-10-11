//  백준 - 스택 수열
//  https://www.acmicpc.net/problem/1874
//  Created by 홍은표 on 2022/10/12.

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

var stack = [Int]()
var number = 1
var answer = ""

for _ in 0..<N {
    let require = readInt()
    
    while number <= require {
        stack.append(number)
        answer += "+\n"
        number += 1
    }
    
    if stack.last == require {
        _ = stack.popLast()
        answer += "-\n"
    } else {
        print("NO"); exit(0)
    }
}

print(answer)
