//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/14.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let NMK = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (N, M, K) = (NMK[0], NMK[1], NMK[2])
    let house = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var sum = house[0..<M].reduce(0, +)
    var answer = sum < K ? 1 : 0
    if N == M { print(answer); continue }
    var left = 1
    var right = M
    
    while left < N {
        sum -= house[left - 1]
        sum += house[right % N]
        if sum < K {
            answer += 1
        }
        left += 1
        right += 1
    }

    print(answer)
}
