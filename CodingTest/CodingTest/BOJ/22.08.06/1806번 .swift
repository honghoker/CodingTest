//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/06.
//

import Foundation

let NS = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, S) = (NS[0], NS[1])
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var right = 0
var sum = 0
var answer = Int.max

for left in 0..<N {
    while sum < S && right < N {
        sum += arr[right]
        right += 1
    }
    
    if sum >= S {
        answer = min(answer, right - left)
    }
    
    sum -= arr[left]
}

print(answer == Int.max ? 0 : answer)
