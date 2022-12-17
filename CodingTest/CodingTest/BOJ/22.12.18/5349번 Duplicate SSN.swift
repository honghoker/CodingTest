//  백준 - Duplicate SSN
//  https://www.acmicpc.net/problem/5349
//  Created by 홍은표 on 2022/12/18.

import Foundation

var map = [String: Int]()
while let number = readLine() { map[number, default: 0] += 1 }
print(map.filter { $0.value > 1 }.map { $0.key }.sorted().joined(separator: "\n"))
