//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/10/20.
//

import Foundation

let k = Int(String(readLine()!))!
var arr = readLine()!.split(separator: " ").map{String($0)}
var answer = [String]()
var visit = Array(repeating: false, count: 10)
var result = [Int]()

func dfs(_ depth: Int, _ now: Int) {
    if depth == k + 1 {
        answer.append(result.map{String($0)}.joined())
        return
    }
    
    for i in 0...9 {
        if !visit[i] {
            if depth > 0 {
                if now <= i && arr[depth - 1] == ">" { continue }
                else if now >= i && arr[depth - 1] == "<" { continue }
            }
            visit[i] = true
            result.append(i)
            dfs(depth + 1, i)
            visit[i] = false
            result.removeLast()
        }
    }
}

dfs(0, 0)

print(answer.last!)
print(answer.first!)
