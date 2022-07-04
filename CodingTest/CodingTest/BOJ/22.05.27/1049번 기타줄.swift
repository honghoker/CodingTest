//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let M = input[1]

var lowPak = 1001
var lowNat = 1001

for _ in 0..<M {
    let inp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let pak = inp[0] // 6개 패키지 가격
    let nat = inp[1] // 낱개 가격
    
    if lowPak > pak {
        lowPak = pak
    }
    
    if lowNat > nat {
        lowNat = nat
    }
}

var result = 0
var bestPrice = lowPak < lowNat * 6 ? lowPak : lowNat * 6
let div = N / 6

result = bestPrice * div
let na = N % 6
if lowPak > lowNat * na {
    result += lowNat * na
} else {
    result += lowPak
}

print(result)
