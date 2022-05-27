//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

let S = Int(readLine()!)!

var low = 1
var high = S
var result = 0

while low <= high {
    let middle = (low + high) / 2
    let sum = (middle) * (middle + 1) / 2 // 합 공식 : n * (n+1) / 2
    
    if sum <= S {
        low = middle + 1
        result = middle
    } else {
        high = middle - 1
    }
}

print(result)
