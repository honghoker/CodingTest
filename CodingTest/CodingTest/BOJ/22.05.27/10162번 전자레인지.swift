//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

var T = Int(readLine()!)!

var a = 0
var b = 0
var c = 0

if T >= 300 {
    a = T / 300
    T -= 300 * a
}

if T >= 60 {
    b = T / 60
    T -= 60 * b
}

if T % 10 == 0 {
    c = T / 10
    print("\(a) \(b) \(c)")
} else {
    print(-1)
}
