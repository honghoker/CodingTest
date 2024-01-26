//  백준 - 열차정렬
//  https://www.acmicpc.net/problem/4198
//  Created by 홍은표 on 24/1/26.

let N = Int(readLine()!)!
let A = (0..<N).map { _ in Int(readLine()!)! }
var lis = [Int](repeating: 1, count: N), lds = lis
var r = 0
for i in stride(from: N - 1, through: 0, by: -1) {
  for j in i + 1..<N {
    if A[i] > A[j] && lis[i] < lis[j] + 1 {
      lis[i] = lis[j] + 1
    } else if A[i] <= A[j] && lds[i] < lds[j] + 1 {
      lds[i] = lds[j] + 1
    }
  }
  let c = lis[i] + lds[i] - 1
  if r < c { r = c }
}
print(r)
