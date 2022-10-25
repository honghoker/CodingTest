//  백준 - 수열의 점수
//  https://www.acmicpc.net/problem/2036
//  Created by 홍은표 on 2022/10/26.

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
var pNum = [Int](), mNum = [Int]()
var answer = 0

for _ in 0..<N {
    let input = readInt()
    if input == 1 { answer += input; continue }
    // 입력이 2, -1 0 일때 답이 0이어야 하므로 0도 mNum 배열에 추가해줘야 한다.
    if input <= 0 { mNum.append(input) }
    else { pNum.append(input) }
}

pNum.sort(by: >); mNum.sort(by: <)

if pNum.count % 2 != 0 { answer += pNum.popLast()! }
if mNum.count % 2 != 0 { answer += mNum.popLast()! }

while !pNum.isEmpty { answer += pNum.removeLast() * pNum.removeLast() }
while !mNum.isEmpty { answer += mNum.removeLast() * mNum.removeLast() }

print(answer)
