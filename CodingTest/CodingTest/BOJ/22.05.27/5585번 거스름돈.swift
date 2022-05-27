//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/26.
//

import Foundation

var money = Int(readLine()!)!
var result = 0

money = 1000 - money

func calc(_ num: Int) {
    if money >= num {
        let count = money / num
        money -= count * num
        result += count
    }
}

calc(500)
calc(100)
calc(50)
calc(10)
calc(5)
result += money

print(result)
