//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/17.
//

import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var minAnswer = Int.max
var maxAnswer = -Int.max

func dfs(_ now: Int, _ depth: Int) {
    if depth == N {
        minAnswer = min(minAnswer, now)
        maxAnswer = max(maxAnswer, now)
        return
    }
    
    if numbers[0] != 0 { numbers[0] -= 1; dfs(now + A[depth], depth + 1); numbers[0] += 1 }
    if numbers[1] != 0 { numbers[1] -= 1; dfs(now - A[depth], depth + 1); numbers[1] += 1 }
    if numbers[2] != 0 { numbers[2] -= 1; dfs(now * A[depth], depth + 1); numbers[2] += 1 }
    if numbers[3] != 0 { numbers[3] -= 1; dfs(now / A[depth], depth + 1); numbers[3] += 1 }
}

dfs(A[0], 1)

print(maxAnswer)
print(minAnswer)
