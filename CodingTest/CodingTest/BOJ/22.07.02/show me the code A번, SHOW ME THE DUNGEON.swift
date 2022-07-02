//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

import Foundation

// N 몬스터의 수
// K 초기체력
// A 몬스터들의 공격력
// P 주민의 수

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var (N, K) = (input[0], input[1])

var A = readLine()!.split(separator: " ").map { Int(String($0))! }
var P = readLine()!.split(separator: " ").map { Int(String($0))! }
var city = [(Int, Int)]()

for i in 0..<N {
    city.append((A[i], P[i]))
}

city = city.sorted { $0.0 == $0.1 ? $0.1 < $1.1 : $0.0 < $1.0 }

var damage = 0
var answer = 0
for i in 0..<N {
    if K < city[i].0 + damage { break }
    K -= city[i].0 + damage
    damage += city[i].0
    answer += city[i].1
}

print(answer)
