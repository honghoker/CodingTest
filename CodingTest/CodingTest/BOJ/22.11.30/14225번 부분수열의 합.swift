//  백준 - 부분수열의 합
//  https://www.acmicpc.net/problem/14225
//  Created by 홍은표 on 2022/11/30.

import Foundation

let N = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map { Int(String($0))! }
var visit = Array(repeating: false, count: N)
var numbers = Array(repeating: false, count: 2000001)

func dfs(_ sum: Int, _ depth: Int) {
    if depth == N { return }
    let value = sum + S[depth]
    numbers[value] = true
    
    dfs(value, depth + 1)
    dfs(sum, depth + 1)
}

dfs(0, 0)

for i in 1...2000000 {
    if !numbers[i] { print(i); break }
}
