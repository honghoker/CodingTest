//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var answer = ""

func dfs(_ now: Int, _ str: String, _ depth: Int) {
    if depth == M {
        answer += str + "\n"
        return
    }
    
    for i in now...N {
        dfs(i, str + "\(i) ", depth + 1)
    }
}

dfs(1, "", 0)

print(answer)
