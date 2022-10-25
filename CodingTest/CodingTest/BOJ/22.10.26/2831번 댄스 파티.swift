//  백준 - 댄스 파티
//  https://www.acmicpc.net/problem/2831
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

var plusMan = [Int](), minusMan = [Int](), plusWoman = [Int](), minusWoman = [Int]()

for _ in 0..<N {
    let man = readInt()
    if man > 0 { plusMan.append(man) }
    else { minusMan.append(abs(man)) }
}

for _ in 0..<N {
    let woman = readInt()
    if woman > 0 { plusWoman.append(woman) }
    else { minusWoman.append(abs(woman)) }
}

plusMan.sort(); plusWoman.sort(); minusMan.sort(); minusWoman.sort()

var left = 0, right = 0, answer = 0

// 남자는 키가 큰 여자, 여자는 키가 작은 남자를 원함
while left < plusMan.count && right < minusWoman.count {
    if plusMan[left] < minusWoman[right] {
        answer += 1; left += 1; right += 1
    } else {
        right += 1
    }
}

left = 0; right = 0

// 남자는 키가 작은 여자, 여자는 키가 큰 남자를 원함
while left < minusMan.count && right < plusWoman.count {
    if minusMan[left] > plusWoman[right] {
        answer += 1; left += 1; right += 1
    } else {
        left += 1
    }
}

print(answer)
