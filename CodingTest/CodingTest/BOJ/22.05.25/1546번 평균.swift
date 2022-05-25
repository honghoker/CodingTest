//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/25.
//

import Foundation

let N = Double(readLine()!)!

var score = readLine()!.split(separator: " ").map{ Double(String($0))! }

let M = score.max()!

let result = ((score.reduce(0, +) / M) * 100) / N

print(result)

