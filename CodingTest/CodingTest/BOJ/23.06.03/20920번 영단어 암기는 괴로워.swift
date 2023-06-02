//  백준 - 영단어 암기는 괴로워
//  https://www.acmicpc.net/problem/20920
//  Created by 홍은표 on 2023/06/03.

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
let (N, M) = (file.readInt(), file.readInt())
var words = [String: (Int, Int)]()
for _ in 0..<N {
    let word = file.readString()
    if words[word] == nil {
        let count = word.count
        if count >= M {
            words[word] = (1, count)
        }
    } else {
        words[word]!.0 += 1
    }
}
print(words.sorted(by: {
    if $0.value.0 != $1.value.0 { return $0.value.0 > $1.value.0 }
    if $0.value.1 != $1.value.1 { return $0.value.1 > $1.value.1 }
    return $0.key < $1.key
}).map { $0.key }.joined(separator: "\n"))
