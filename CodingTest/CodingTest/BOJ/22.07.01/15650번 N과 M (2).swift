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

func dfs(_ now: Int, _ depth: Int) {
    if M == depth {
        print(stack.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in now...N {
        if i+1 <= N {
            stack.append(i+1)
            dfs(i+1, depth + 1)
            stack.removeLast()
        }
    }
}

dfs(0, 0)
