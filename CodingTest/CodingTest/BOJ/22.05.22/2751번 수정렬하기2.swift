//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

var arr = Set<Int>()

let N = Int(readLine()!)!

for _ in 0..<N {
    let input = Int(readLine()!)!
    arr.insert(input)
}

let result = arr.sorted(by: <)

for i in 0..<result.count {
    print(result[i])
}
