//
//  백준 - 마인크래프트
//  https://www.acmicpc.net/problem/18111
//
//  Created by 홍은표 on 24/05/03.
//

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

let (N, M, B, MB) = (readInt(), readInt(), readInt(), 64_000_000)
var r = (Int.max, 0), min = Int.max, max = -Int.max
var A = [Int: Int]()

for _ in 0..<N {
  for _ in 0..<M {
    let I = readInt()
    if min > I { min = I }
    if max < I { max = I }
    A[I, default: 0] += 1
  }
}

for i in stride(from: max, through: min, by: -1) {
  let f = A.filter { $0.key > i }.reduce(0) { $0 + ($1.key - i) * $1.value }
  
  guard f <= MB else { continue }
  
  let s = A.filter { $0.key < i }.reduce(0) { $0 + (i - $1.key) * $1.value }
  
  guard s <= B + f else { continue }

  let t = f * 2 + s
  
  guard r.0 > t else { continue }
  
  r = (t, i)
}

print(r.0, r.1)
