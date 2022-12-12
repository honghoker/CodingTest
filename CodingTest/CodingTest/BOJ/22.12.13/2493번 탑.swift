//  백준 - 탑
//  https://www.acmicpc.net/problem/2493
//  Created by 홍은표 on 2022/12/13.

import Foundation

let N = Int(readLine()!)!
let top = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [Int]()
var answer = Array(repeating: 0, count: N)

for idx in stride(from: N-1, through: 0, by: -1) {
    while !stack.isEmpty && top[idx] > top[stack.last!] {
        answer[stack.popLast()!] = idx + 1
    }
    stack.append(idx);
}
print( answer.map { String($0) }.joined(separator: " ") )
