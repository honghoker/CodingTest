//
//  mian.swift
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
func dfs(_ now: Int, _ str: String, _ depth: Int) {
    if M == depth {
        answer += str + "\n"
        return
    }
    
    for i in now..<N {
        dfs(i, str + "\(arr[i]) ", depth + 1)
    }
}

dfs(0, "", 0)
print(answer)
