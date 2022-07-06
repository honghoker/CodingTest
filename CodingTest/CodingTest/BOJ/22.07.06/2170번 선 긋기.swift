//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/06.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let file = FileIO()

let N = file.readInt()
var lines = [(Int, Int)]()
for _ in 0..<N {
    lines.append((file.readInt(), file.readInt()))
}
lines.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

var left = -Int.max
var right = -Int.max
var answer = 0
for i in 0..<N {
    // 선이 겹쳐지지 않을 경우
    if right < lines[i].0 {
        // 결과에 더함
        answer += right - left
        // 현재 구간을 이번 선분으로 초기화
        left = lines[i].0
        right = lines[i].1
    } else {
        // 선이 겹쳐질 경우 right를 늘림
        right = max(right, lines[i].1)
    }
}
// 마지막 구간 결과에 더하기
answer += right-left
print(answer)
