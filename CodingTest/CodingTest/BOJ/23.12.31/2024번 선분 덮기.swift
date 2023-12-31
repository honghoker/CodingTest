//  백준 - 선분 덮기
//  https://www.acmicpc.net/problem/2024
//  Created by 홍은표 on 23/12/31.

import Foundation

let M = Int(readLine()!)!
var line = [(Int, Int)]()
while let I = readLine() {
  let NM = I.split(separator: " ").map { Int(String($0))! }
  let (N, M) = (NM[0], NM[1])
  if N == 0 && M == 0 { break }
  if N < 0 && M < 0 { continue }
  line.append((N, M))
}
line.sort(by: { $0.0 < $1.0 })

var left = -50000, right = 0, temp = 0, answer = 0
for (l, r) in line {
  if left < l && l <= right {
    if r >= M {
      right = M
      answer += 1
      break
    }
    if temp <= r {
      temp = r
    }
  } else {
    if right > temp { break }
    (left, right) = (right, temp)
    answer += 1
  }
}
print(right == M ? answer : 0)
