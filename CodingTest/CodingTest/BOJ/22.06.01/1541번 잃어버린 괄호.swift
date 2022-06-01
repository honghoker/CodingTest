//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

import Foundation

let minusSplit = readLine()!.split(separator: "-").map { String($0) }
let plus = minusSplit[0].split(separator: "+").map { Int(String($0))! }

// 괄호 제한이 없다.
// 마이너스 시작할 때는 무조건 괄호 시작
var answer = 0

for num in plus {
    answer += num
}

var minusTotal = 0

for i in 1..<minusSplit.count {
    let minus = minusSplit[i].split(separator: "+").map { Int(String($0))! }
    for j in minus {
        minusTotal += j
    }
}

print(answer - minusTotal)
