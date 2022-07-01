//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var arr = Array(Set(readLine()!.split(separator: " ").map { Int(String($0))! })).sorted()
var answer = ""
func dfs(_ str: String, _ depth: Int) {
    if M == depth {
        answer += str + "\n"
        return
    }
    for key in arr {
        dfs(str + "\(key) ", depth + 1)
    }
}
dfs("", 0)
print(answer)
