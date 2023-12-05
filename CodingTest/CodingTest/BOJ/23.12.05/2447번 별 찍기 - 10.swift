//  백준 - 별 찍기 - 10
//  https://www.acmicpc.net/problem/2447
//  Created by 홍은표 on 23/12/05.

import Foundation

// 풀이 1
// 메모리: 87424 KB, 시간: 528 ms
let N = Int(readLine()!)!
func dfs(_ x: Int, _ y: Int, _ s: Int) -> String {
    if (x / s) % 3 == 1 && (y / s) % 3 == 1 { return " " }
    return s / 3 == 0 ? "*" : dfs(x, y, s / 3)
}
print((0..<N).map { i in (0..<N).map { j in dfs(i, j, N) }.joined() }.joined(separator: "\n"))

// 풀이 2
// 메모리: 86988 KB, 시간: 52 ms
func rec(_ n: Int) -> [String] {
    if n == 1 { return ["*"] }
    let p = rec(n/3)
    var o = [String](), t = [String]()
    for s in p { 
        o += [String(repeating: s, count: 3)]
        t += [s + String(repeating: " ", count: n/3) + s]
    }
    return o + t + o
}
print(rec(Int(readLine()!)!).joined(separator: "\n"))
