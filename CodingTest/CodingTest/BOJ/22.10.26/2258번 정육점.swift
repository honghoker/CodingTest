//  백준 - 정육점
//  https://www.acmicpc.net/problem/2258
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

let (N, M) = (readInt(), readInt())
var meats = [(w: Int, c: Int)]()

for _ in 0..<N { meats.append((w: readInt(), c: readInt())) }
// 가격이 싼 고기는 공짜로 얻을 수 있으므로 무게 내림차순, 가격 오름차순 정렬
// 가격이 싸고 무게가 큰 고기 부터.
meats.sort { $0.c == $1.c ? $0.w > $1.w : $0.c < $1.c }

var weight = 0, same = 0
var answer = Int.max

for i in 0..<N {
    weight += meats[i].w
    
    // 현재 고기와 바로 전 고기가 가격이 같을 경우 가격 추가(가격이 싼 고기만 공짜로 얻을 수 있기 때문)
    if i >= 1 && meats[i].c == meats[i-1].c {
        same += meats[i].c
    } else { same = 0 }
    
    if weight >= M { answer = min(answer, meats[i].c + same) }
}

print(answer == Int.max ? -1 : answer)
