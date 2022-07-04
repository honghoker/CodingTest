//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map( { Int(String($0))! })

var arr = [Int]()

for i in 1...input.last! {
    for _ in 1...i {
        arr.append(i)
    }
}

let result = Array(arr[input.first!-1...input.last!-1])

print(result.reduce(0, +))

