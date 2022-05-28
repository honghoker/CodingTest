//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let N = input[0]
var K = input[1]
var arr = [Int]()
var result = 0
for _ in 0..<N {
    let money = Int(readLine()!)!
    if K >= money {
        arr.append(money)
    }
}

let sortArr = arr.sorted(by: >)
for i in 0..<sortArr.count {
    if sortArr[i] <= K {
        let num = K / sortArr[i]
        K %= sortArr[i]
        result += num
    }
}

print(result)
