//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

var caseNum = 0
while true {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let L = input[0] // 사용가능
    let P = input[1] // 연속하는 일
    let V = input[2] // 휴가
    var result = 0
    
    if L == 0 && P == 0 && V == 0 {
        break
    }
    
    let num1 = V / P
    let num2 = V % P
    result = num1 * L
    
    if num2 <= L {
        result += num2
    } else {
        result += L
    }
    
    caseNum += 1
    
    print("Case \(caseNum): \(result)")
}


