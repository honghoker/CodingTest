//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var visit = Array(repeating: false, count: N)
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort()

var answer = ""
func dfs(_ str: String, _ depth: Int) {
    if M == depth {
        answer += str + "\n"
        return
    }
    
    for i in 0..<N {
        if !visit[i] {
            visit[i] = true
            dfs(str + "\(arr[i]) ", depth + 1)
            visit[i] = false
        }
    }
}

dfs("", 0)
print(answer)
