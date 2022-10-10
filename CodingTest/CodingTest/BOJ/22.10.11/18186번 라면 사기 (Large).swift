//  백준 - 라면 사기 (Large)
//  https://www.acmicpc.net/problem/18186
//  Created by 홍은표 on 2022/10/11.

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

let (N, B, C) = (readInt(), readInt(), readInt())
var arr = [Int]()

for _ in 0..<N {
    arr.append(readInt())
}
arr += [0, 0]

var answer = 0

if B <= C {
    print(arr.reduce(0, +) * B) // B로만 사는게 가장 싸다
} else {
    for i in 0..<N {
        if arr[i] == 0 { continue }
        if arr[i+1] > arr[i+2] {
            let twoVal = min(arr[i], arr[i+1] - arr[i+2])
            arr[i] -= twoVal; arr[i+1] -= twoVal
            answer += (B + C) * twoVal
            
            let threeVal = min(arr[i], arr[i+1], arr[i+2])
            arr[i] -= threeVal; arr[i+1] -= threeVal; arr[i+2] -= threeVal
            answer += (B + C * 2) * threeVal
        } else {
            let threeVal = min(arr[i], arr[i+1], arr[i+2])
            arr[i] -= threeVal; arr[i+1] -= threeVal; arr[i+2] -= threeVal
            answer += (B + C * 2) * threeVal
            
            let twoVal = min(arr[i], arr[i+1])
            arr[i] -= twoVal; arr[i+1] -= twoVal
            answer += (B + C) * twoVal
        }
        
        answer += arr[i] * B
    }
    print(answer)
}
