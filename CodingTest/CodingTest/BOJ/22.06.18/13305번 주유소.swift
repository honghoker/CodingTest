//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/18.
//

import Foundation

let N = Int(readLine()!)!

let road = readLine()!.split(separator: " ").map { Int(String($0))! }
let city = readLine()!.split(separator: " ").map { Int(String($0))! }

var minPrice = city[0]
var price = city[0] * road[0]

for i in 1..<city.count - 1 {
    minPrice = min(minPrice, city[i])
    price += minPrice * road[i]
}

print(price)
