//
//  튜플.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/26.
//

import Foundation

func solution(_ s:String) -> [Int] {
    let numbers = s
                    .replacingOccurrences(of: "{", with: "")
                    .replacingOccurrences(of: "}", with: "")
                    .split(separator: ",").map { Int(String($0))! }
    let map = numbers.reduce(into: [:]) { counts, number in
       counts[number, default: 0] += 1
    }
    return map.sorted { $0.value > $1.value }.map { $0.key }
}
