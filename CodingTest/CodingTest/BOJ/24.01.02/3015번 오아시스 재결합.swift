//  백준 - 오아시스 재결합
//  https://www.acmicpc.net/problem/3015
//  Created by 홍은표 on 24/1/2.

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

var stack = [(Int, Int)](), r = 0
for _ in (0..<readInt()) {
  let n = readInt()
  var c = 1
  while !stack.isEmpty, stack.last!.0 <= n {
    let (a, b) = stack.removeLast()
    if a == n {
      c += b
    }
    r += b
  }
  if !stack.isEmpty { r += 1 }
  stack.append((n, c))
}
print(r)
