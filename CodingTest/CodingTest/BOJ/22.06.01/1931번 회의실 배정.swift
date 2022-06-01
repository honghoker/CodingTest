//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

import Foundation

let N = Int(readLine()!)!
var conferences = [(Int, Int)]()
var now = -1
var answer = 0

for _ in 0..<N {
    let time = readLine()!.split(separator: " ").map { Int(String($0))! }
    conferences.append((time[0], time[1]))
}

conferences.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

for conference in conferences {
    if conference.0 >= now {
        now = conference.1
        answer += 1
    }
}

print(answer)
