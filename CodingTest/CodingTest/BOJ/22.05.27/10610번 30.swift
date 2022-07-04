//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

let input = Array(readLine()!).sorted(by: >)

let sum = input.reduce(0) { $0 + Int(String($1))! }

if input.last != "0" || sum % 3 != 0 {
    print("-1")
} else {
    print(String(input))
}
