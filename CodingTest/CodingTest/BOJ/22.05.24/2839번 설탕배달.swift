//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/24.
//

import Foundation

var n = Int(readLine()!)!
var result = 0

while true {
    if n % 5 == 0 {
        result += n / 5
        print(result)
        break
    }
    n -= 3
    result += 1
    
    if n < 0 {
        print(-1)
        break
    }
}
