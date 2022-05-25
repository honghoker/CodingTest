//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ String($0) }
let X = input[0]
let Y = input[1]

var strX = X.map{ String($0) }
strX.reverse()
let numX = strX.reduce("", +)

var strY = Y.map{ String($0) }
strY.reverse()
let numY = strY.reduce("", +)

var sumXY = Int(numX)! + Int(numY)!
var strXY = String(sumXY).map{ String($0) }
strXY.reverse()
let result = strXY.reduce("", +)

print(Int(result)!)
