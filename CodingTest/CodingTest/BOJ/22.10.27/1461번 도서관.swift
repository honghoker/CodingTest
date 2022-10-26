//  백준 - 도서관
//  https://www.acmicpc.net/problem/1461
//  Created by 홍은표 on 2022/10/27.

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
var pbooks = [Int](), mbooks = [Int]()

for _ in 0..<N {
    let input = readInt()
    if input > 0 { pbooks.append(input) }
    else { mbooks.append(input) }
}

pbooks.sort(by: >); mbooks.sort(by: <)

var answer = 0, idx = 0

while idx < pbooks.count {
    answer += pbooks[idx] * 2
    idx += M
}
idx = 0
while idx < mbooks.count {
    answer += abs(mbooks[idx] * 2)
    idx += M
}

answer -= max(pbooks.isEmpty ? 0 : pbooks.first!, mbooks.isEmpty ? 0 : abs(mbooks.first!))

print(answer)
