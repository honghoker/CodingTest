//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

let N = Int(readLine()!)!

let time = Array(readLine()!.split(separator: " ").map { Int(String($0))! } ).sorted(by: < )
var sum = 0
var result = 0

for t in time {
    sum += t
    result += sum
}

print(result)
