//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

let N = Int(readLine()!)!
var arr = Set<String>()

for _ in 0..<N {
    let input = readLine()!
    arr.insert(input)
}

let result = arr.sorted {
    $0.count == $1.count ? $0 < $1 : $0.count < $1.count
}

for i in 0..<result.count {
    print(result[i])
}

