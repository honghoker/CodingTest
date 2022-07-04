//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/07.
//

import Foundation

let n = Int(readLine()!)!

let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = numbers.max()!
var temp = 0

if answer < 0 {
    print(answer)
} else {
    for number in numbers {
        temp += number
        temp = max(temp, number)
        
        if answer < temp {
            answer = temp
        }
    }
    print(answer)
}
