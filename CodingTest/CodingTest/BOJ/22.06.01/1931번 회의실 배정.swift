//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

import Foundation

let N = Int(readLine()!)!
var map = [(Int, Int)]()
var answer = 0
for _ in 0..<N {
    let time = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append((time[0], time[1]))
}

map.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

var end = -1

for i in 0..<map.count {
    if end <= map[i].0 {
        end = map[i].1
        answer += 1
    }
}

print(answer)
