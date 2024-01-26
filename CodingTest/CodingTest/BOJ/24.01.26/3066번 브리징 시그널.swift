//  백준 - 브리징 시그널
//  https://www.acmicpc.net/problem/3066
//  Created by 홍은표 on 24/1/26.

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

func lowerBound(_ arr: [Int], _ find: Int) -> Int {
  var start = 0, end = arr.count
  while start < end {
    let mid = (start + end) / 2
    arr[mid] < find ? ( start = mid + 1 ) : ( end = mid )
  }
  return end
}

var r = ""
for _ in 0..<readInt() {
  var dp = [Int]()
  for _ in 0..<readInt() {
    let k = readInt()
    let index = lowerBound(dp, k)
    if dp.count == index { dp.append(k) }
    else { dp[index] = k }
  }
  
  r += "\(dp.count)\n"
}

print(r)
