//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/25.
//

import Foundation

let N = Int(readLine()!)!
var result = Array(repeating: "", count : N)

for i in 0..<N {
    let input = readLine()!.map{ String($0) }
    
    if i == 0 {
        result = input
    }
    
    for (index, ch) in input.enumerated() {
        if result[index] != ch {
            result[index] = "?"
        }
    }
}

print(result.reduce("", +))






