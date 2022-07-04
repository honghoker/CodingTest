//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/26.
//

import Foundation

let N = Int(readLine()!)!
var result = 0

for _ in 0..<N {
    let arr = readLine()!.map { String($0) }
    var check = [String]()
    var frontChar = ""
    var chk = false
    
    for char in arr {
        if check.contains(char) {
            chk = true
            break
        }
        
        if char != frontChar {
            check.append(frontChar)
            frontChar = char
        }
    }
    if chk == false {
        result += 1
    }
}

print(result)
