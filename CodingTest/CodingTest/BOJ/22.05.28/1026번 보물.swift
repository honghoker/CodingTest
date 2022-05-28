//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/28.
//

import Foundation

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var B = readLine()!.split(separator: " ").map { Int(String($0))! }

let sortA = A.sorted(by: < )
let sortB = B.sorted(by: > )

var result = 0
for i in 0..<N {
    result += sortA[i] * sortB[i]
}

print(result)
