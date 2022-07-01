//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (input[0], input[1])

var universe = [[Int]]()
var answer = 0

for _ in 0..<M {
    universe.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var visit = Array(repeating: false, count: M)
var arr = Array(repeating: Array(repeating: 0, count: N), count: N)

func compare(_ uni1: [Int], _ uni2: [Int]) -> Bool {
    for k in 0..<N {
        for p in k+1..<N {
            if uni1[k] < uni1[p] && uni2[k] >= uni2[p] {
                return false
            } else if uni1[k] > uni1[p] && uni2[k] <= uni2[p] {
                return false
            } else if uni1[k] == uni1[p] && uni2[k] != uni2[p] {
                return false
            }
        }
    }
    return true
}

for i in 0..<M {
    for j in i+1..<M {
        if compare(universe[i], universe[j]) {
            answer += 1
        }
    }
}

print(answer)
