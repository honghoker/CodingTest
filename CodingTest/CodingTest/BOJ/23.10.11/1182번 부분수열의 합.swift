//  백준 - 부분수열의 합
//  https://www.acmicpc.net/problem/1182
//  Created by 홍은표 on 23/10/11.

import Foundation

let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var R = NS[1] == 0 ? -1 : 0
func dfs(_ I: Int, _ S: Int) {
    if I == NS[0] { if S == NS[1] { R += 1 }; return }
    dfs(I + 1, S + A[I])
    dfs(I + 1, S)
}
dfs(0, 0)
print(R)
