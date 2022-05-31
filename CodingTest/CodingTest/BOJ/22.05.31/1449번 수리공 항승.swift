//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/31.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let L = input[1]
let leak = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: <)

var pipe = Array(repeating: false, count: 1001)

for index in leak {
    pipe[index] = true
}

var answer = 0
var index = 0

while index < 1001 {
    if pipe[index] == true { // 새는곳이면
        index += L
        answer += 1
    } else { // 새는곳 아니면
        index += 1
    }
}

print(answer)
