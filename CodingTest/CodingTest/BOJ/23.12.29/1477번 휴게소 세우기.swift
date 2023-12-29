//  백준 - 휴게소 세우기
//  https://www.acmicpc.net/problem/1477
//  Created by 홍은표 on 23/12/29.

import Foundation

let I = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, L) = (I[0], I[1], I[2])
let A = ([0] + readLine()!.split(separator: " ").map { Int(String($0))! } + [L]).sorted()
var l = 1, h = L
while l <= h {
  let mid = (l + h) / 2
  var s = 0
  for i in 1..<A.count {
    s += (A[i] - A[i-1] - 1) / mid
  }
  if s > M {
    l = mid + 1
  } else {
    h = mid - 1
  }
}
print(l)
