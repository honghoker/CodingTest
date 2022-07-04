//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

var S = Array(readLine()!.map{ String($0) })

var zeroCount = 0
var oneCount = 0
var before = "0"

if S[0] == "0" {
    zeroCount += 1
    before = "0"
} else {
    oneCount += 1
    before = "1"
}

for i in 1..<S.count {
    if S[i] == "0" {
        if before != "0" {
            zeroCount += 1
            before = "0"
        }
    } else {
        if before != "1" {
            oneCount += 1
            before = "1"
        }
    }
}

print(min(zeroCount , oneCount))
