//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/01.
//

import Foundation

let N = Int(readLine()!)!

var answer = 0

for i in 1...N {
    answer += (N/i) * i
}

print(answer)
