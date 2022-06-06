//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (a, b) = (input[0], input[1])

if a < 100 {
    print(1)
} else {
    let diff = 1.0 - 0.01 * Float(b)
    if Float(a) * diff < 100 {
        print(1)
    } else {
        print(0)
    }
}
