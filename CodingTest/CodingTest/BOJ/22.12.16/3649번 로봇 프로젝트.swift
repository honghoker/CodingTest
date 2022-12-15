//  백준 - 로봇 프로젝트
//  https://www.acmicpc.net/problem/3649
//  Created by 홍은표 on 2022/12/16.

import Foundation

var answer = ""
let nano = 10_000_000

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

while true {
    let x = readInt() * nano
    let n = readInt()
    var lego = [Int]()
    for _ in 0..<n { lego.append(readInt()) }
    lego.sort()

    var left = 0, right = lego.count - 1
    var result = "danger\n"

    while left < right {
        if lego[left] + lego[right] == x {
            result = "yes \(lego[left]) \(lego[right])\n"
            break
        }
        
        if lego[left] + lego[right] < x { left += 1 }
        else { right -= 1 }
    }

    answer.write(result)
}
