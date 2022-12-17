//  백준 - 멘토와 멘티
//  https://www.acmicpc.net/problem/26265
//  Created by 홍은표 on 2022/12/18.

import Foundation

let N = Int(readLine()!)!
var map = [String: [String]]()
var answer = ""
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    map[input[0], default: []].append(input[1])
}

for key in map.keys.sorted() { map[key]!.sorted(by: >).forEach { answer.write("\(key) \($0)\n") } }

print(answer)
