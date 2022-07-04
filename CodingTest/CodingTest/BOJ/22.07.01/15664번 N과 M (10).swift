//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var visit = [Int: Int]()
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

for index in arr {
    visit[index, default: 0] += 1
}
let keys = visit.keys.sorted()
var answer = ""
func dfs(_ now: Int, _ str: String, _ depth: Int) {
    if M == depth {
        answer += str + "\n"
        return
    }
    
    for key in keys.filter({ now <= $0 }) {
        if visit[key] != 0 {
            visit[key]! -= 1
            dfs(key, str + "\(key) ", depth + 1)
            visit[key]! += 1
        }
    }
}

dfs(keys.first!, "", 0)

print(answer)
