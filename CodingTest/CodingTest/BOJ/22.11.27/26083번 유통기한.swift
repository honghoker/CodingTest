//  백준 - 유통기한
//  https://www.acmicpc.net/problem/26083
//  Created by 홍은표 on 2022/11/27.

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

func isYear(_ year: Int) -> Bool {
    return 0 <= year && year <= 99
}
func isDay(_ isLeap: Bool, _ month: Int, _ day: Int) -> Bool {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        return 1 <= day && day <= 31
    case 4, 6, 9, 11:
        return 1 <= day && day <= 30
    case 2:
        return 1 <= day && day <= (isLeap ? 29 : 28)
    default:
        return false
    }
}
func calDay(_ year: Int, _ month: Int, _ day: Int) -> Int {
    return (year * 10000) + (month * 100) + day
}

let (Y, M, D) = (readInt(), readInt(), readInt())
let now = calDay(Y, M, D)
let N = readInt()
var answer = ""
for _ in 0..<N {
    let (year, month, day) = (readInt(), readInt(), readInt())
    var arr = [Int]()
    // 년 월 일
    if isYear(year) && isDay(year % 4 == 0, month, day) {
        arr.append(calDay(year, month, day))
    }
    // 일 월 년
    if isYear(day) && isDay(day % 4 == 0, month, year) {
        arr.append(calDay(day, month, year))
    }
    // 월 일 년
    if isYear(day) && isDay(day % 4 == 0, year, month) {
        arr.append(calDay(day, year, month))
    }
    if arr.isEmpty {
        answer += "invalid\n"
    } else {
        answer += arr.filter { $0 < now }.isEmpty ? "safe\n" : "unsafe\n"
    }
}

print(answer)
