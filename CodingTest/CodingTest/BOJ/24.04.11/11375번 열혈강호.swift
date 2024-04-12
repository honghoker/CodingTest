//
//  백준 - 열혈강호
//  https://www.acmicpc.net/problem/11375
//
//  Created by 홍은표 on 24/04/11.
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

let (N, M) = (readInt(), readInt())
var adj = (0..<N).map { _ in (0..<readInt()).map { _ in readInt()-1 } }
var D = [Int](repeating: -1, count: M)
var V = [Bool](repeating: false, count: M)
var r = 0

func dfs(_ a: Int) -> Bool {
  for b in adj[a] where !V[b] {
    V[b] = true
    if D[b] == -1 || dfs(D[b]) {
      D[b] = a
      return true
    }
  }
  
  return false
}

for i in 0..<N {
  V = .init(repeating: false, count: M)
  if dfs(i) {
    r += 1
  }
}

print(r)
