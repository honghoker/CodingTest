//  백준 - 합
//  https://www.acmicpc.net/problem/1132
//  Created by 홍은표 on 2022/12/10.

import Foundation

let N = Int(readLine()!)!
var map = [Character: Double]()
var frontAlpha = Set<Character>()

for _ in 0..<N {
    let numbers = Array(readLine()!)
    frontAlpha.insert(numbers.first!)
    for (idx, ch) in numbers.reversed().enumerated() {
        map[ch, default: 0] += pow(10, Double(idx))
    }
}

if map.count == 10 {
    for (key, _) in map.sorted(by: { $0.value < $1.value }) where !frontAlpha.contains(key) {
        map[key] = nil; break
    }
}

var answer = 0
var num = 9
for value in map.values.sorted(by: >) {
    answer += Int(value) * num
    num -= 1
}

print(answer)
