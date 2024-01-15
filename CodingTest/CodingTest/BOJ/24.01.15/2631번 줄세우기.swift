//  백준 - 줄세우기
//  https://www.acmicpc.net/problem/2631
//  Created by 홍은표 on 24/1/15.

import Foundation

let A = (0..<Int(readLine()!)!).map { _ in Int(readLine()!)! }
var dp = [Int]()

func lowerbound(_ arr: [Int], _ find: Int) -> Int {
  var start = 0, end = arr.count
  while start < end {
    let mid = (start + end) / 2
    if arr[mid] < find { start = mid + 1 }
    else { end = mid }
  }
  return end
}
      
for i in 0..<A.count {
  let index = lowerbound(dp, A[i])
  if dp.count == index {
    dp.append(A[i])
  } else {
    dp[index] = A[i]
  }
}
print(A.count - dp.count)
