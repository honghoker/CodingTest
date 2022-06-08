//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/08.
//

import Foundation

// 2 x n
// 1 x 2 가로 2칸, 세로 1칸, 위 아래 2개 놓으면 2x2
// 2 x 1 가로 1칸, 세로 2칸, 좌 우 2개 놓으면 2x2

let n = Int(readLine()!)!

var answer = 0
var stack = [0]

while !stack.isEmpty {
    let node = stack.removeLast()
    if node == n {
        break
    }
    answer += 1
    // 1 x 2로 시작
    if node < n - 2 {
        stack.append(node + 2)
    }
    // 2 x 1로 시작
    if node < n - 1 {
        stack.append(node + 1)
    }
}

print(answer % 10007)


