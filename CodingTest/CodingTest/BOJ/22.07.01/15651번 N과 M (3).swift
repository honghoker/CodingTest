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

func dfs(_ now: String, _ depth: Int) {
    if M == depth {
        answer += now + "\n"
        return
    }

    for i in 1...N {
        dfs(now + "\(i) ", depth + 1)
    }
}

dfs("", 0)
print(answer)
