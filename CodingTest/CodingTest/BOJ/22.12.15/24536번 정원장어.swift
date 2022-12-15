//  백준 - 정원장어
//  https://www.acmicpc.net/problem/24536
//  Created by 홍은표 on 2022/12/15.

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
let dir = file.readString().map { String($0) }
var left = [Int](), right = [Int]()

for i in 0..<N {
    let val = file.readInt()
    if dir[i] == "L" { left.append(val) }
    else { right.append(val) }
}
right.reverse()

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if find > numbers[mid] { start = mid + 1 }
        else { end = mid }
    }
    return end
}

func getLISLength(_ arr: [Int]) -> [Int] {
    var dp = [arr[0]]
    var bf = [1]
    for i in 1..<arr.count {
        let index = lowerBound(arr[i], dp)
        if dp.count == index { dp.append(arr[i]) }
        else { dp[index] = arr[i] }
        bf.append(dp.count)
    }
    return bf
}

let lisLeftLen = left.count > 0 ? getLISLength(left) : nil
let lisRightLen = right.count > 0 ? getLISLength(right) : nil

var leftCnt = 0, rightCnt = 0, maxVal = 0

for i in 0..<N {
    var leftSurviveCnt = 0, rightSurviveCnt = 0
    if dir[i] == "L" { leftCnt += 1 }
    
    leftSurviveCnt = leftCnt > 0 && lisLeftLen != nil ? lisLeftLen![leftCnt - 1] : 0
    rightSurviveCnt = rightCnt < right.count && lisRightLen != nil ? lisRightLen![right.count - rightCnt - 1] : 0
    
    if dir[i] == "R" { rightCnt += 1 }
    
    maxVal = max(maxVal, leftSurviveCnt + rightSurviveCnt)
}
print(N - maxVal)
