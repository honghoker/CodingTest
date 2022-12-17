//  백준 - Billing
//  https://www.acmicpc.net/problem/5342
//  Created by 홍은표 on 2022/12/18.

import Foundation

let costs = [
    "Paper": 57.99,
    "Printer": 120.50,
    "Planners": 31.25,
    "Binders": 22.50,
    "Calendar": 10.95,
    "Notebooks": 11.20,
    "Ink": 66.95
]
var answer = 0.0
while let item = readLine(), item != "EOI" { answer += costs[item]! }
print("$\(answer)")
