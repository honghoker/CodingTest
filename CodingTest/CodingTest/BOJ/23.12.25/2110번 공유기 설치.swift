//  백준 - 공유기 설치
//  https://www.acmicpc.net/problem/2110
//  Created by 홍은표 on 23/12/25.

import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), bIdx = 0; buffer.append(0)

@inline(__always) func read() -> UInt8 {
  defer { bIdx += 1 }
  return buffer.withUnsafeBufferPointer { $0[bIdx] }
}

@inline(__always) func readInt() -> Int {
  var number = 0, byte = read(), isNegative = false
  while byte == 10 || byte == 32 { byte = read() }
  if byte == 45 { byte = read(); isNegative = true }
  while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = read() }
  return number * (isNegative ? -1 : 1)
}

let (N, C) = (readInt(), readInt())
let A = (0..<N).map { _ in readInt() }.sorted()
var start = 1, end = A[N-1] - A[0], r = 0
while start <= end {
  let mid = (start + end) / 2
  var idx = 0, cnt = 1
  for i in 0..<N {
    if A[i] - A[idx] >= mid {
      cnt += 1
      idx = i
    }
  }
  
  if cnt < C {
    end = mid - 1
  } else {
    start = mid + 1
    r = mid
  }
}
print(r)
