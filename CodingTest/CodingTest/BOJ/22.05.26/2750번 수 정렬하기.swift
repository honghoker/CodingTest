//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/26.
//

import Foundation

let N = Int(readLine()!)!
var arr = Set<Int>()

for _ in 0..<N {
    arr.insert(Int(readLine()!)!)
}

let result = arr.sorted(by: <)

for i in 0..<result.count {
    print(result[i])
}
