//  백준 - H4x0r
//  https://www.acmicpc.net/problem/26768
//  Created by 홍은표 on 2022/12/25.

import Foundation

let map: [Character: Int] = [
    "a": 4,
    "e": 3,
    "i": 1,
    "o": 0,
    "s": 5
]

let s = readLine()!
var answer = ""

s.forEach {
    if let val = map[$0] { answer += "\(val)" }
    else { answer += "\($0)" }
}

print(answer)
