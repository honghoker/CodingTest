//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

// 참고 https://jjaewon.tistory.com/24
import Foundation

let N = Int(readLine()!)!
var answer = 0

var d = Array(repeating: 0, count: 1000001) // cost
var s = Array(repeating: 0, count: 1000001) // 왼쪽에 있으면서 큰 수 중 가장 오른쪽에 있는 수
var e = Array(repeating: N-1, count: 1000001) // 오른쪽에 있으면서 큰 수 중 가장 왼쪽에 있는 수
var stack = [Int]()

func work() {
    for i in 0..<N {
        s[i] = 0
        e[i] = N-1
    }
    for i in 0..<N {
        while(!stack.isEmpty && d[stack.last!] <= d[i]) {
            let node = stack.removeLast()
            e[node] = i-1
        }
        stack.append(i)
    }
    while(!stack.isEmpty) { stack.removeLast() }
    for i in stride(from: N-1, through: 0, by: -1) {
        while(!stack.isEmpty && d[stack.last!] < d[i]) {
            let node = stack.removeLast()
            s[node] = i+1
        }
        stack.append(i)
    }
    while(!stack.isEmpty) { stack.removeLast() }
    for i in 0..<N {
        answer += d[i] * ((e[i] - i) * (i - s[i]) + e[i] - s[i] + 1)
    }
}

d = readLine()!.split(separator: " ").map { Int(String($0))! }
work()
for i in 0..<N {
    d[i] *= -1
}
work()

print(answer)
