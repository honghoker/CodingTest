//  백준 - 특식 배부
//  https://www.acmicpc.net/problem/27110
//  Created by 홍은표 on 2023/01/09.

import Foundation

let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input.map { N >= $0 ? $0 : N }.reduce(0, +))
