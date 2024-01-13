//  백준 - 별 찍기 - 19
//  https://www.acmicpc.net/problem/10994
//  Created by 홍은표 on 24/1/14.

import Foundation

func rec(_ n: Int) -> [String] {
  if n == 1 { return ["*"] }
  let l = 4 * (n - 1) + 1
  let f = String(repeating: "*", count: l)
  let s = "*" + String(repeating: " ", count: l - 2) + "*"
  return [f, s] + rec(n - 1).map { "* " + $0 + " *" } + [s, f]
}
print(rec(Int(readLine()!)!).map { $0 }.joined(separator: "\n"))
