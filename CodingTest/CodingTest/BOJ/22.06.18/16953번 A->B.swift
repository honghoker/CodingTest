//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (A, B) = (input[0], input[1])

var answer = Int.max

func dfs(_ now: Int, _ count: Int) {
    if now > B { return }
    if now == B {
        answer = min(count, answer)
    }
    dfs(now * 2, count + 1)
    dfs(now * 10 + 1, count + 1)
}
dfs(A, 1)

print(answer == Int.max ? -1 : answer)
