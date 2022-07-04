//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var visit = Array(repeating: false, count: N+1)
var stack = [Int]()

func dfs(_ depth: Int) {
    if M == depth {
        print(stack.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...N {
        if !visit[i] {
            visit[i] = true
            stack.append(i)
            dfs(depth + 1)
            visit[i] = false
            stack.removeLast()
        }
    }
}

dfs(0)
