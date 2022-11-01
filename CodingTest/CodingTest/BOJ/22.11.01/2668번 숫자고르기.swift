//  백준 - 숫자고르기
//  https://www.acmicpc.net/problem/2668
//  Created by 홍은표 on 2022/11/01.

import Foundation

let N = Int(readLine()!)!
var arr = [0]
for _ in 0..<N { arr.append((Int(readLine()!)!)) }

var answer = [Int]()
var visit = [Bool]()

func dfs(_ start: Int, _ now: Int) -> Bool {
    if !visit[now] {
        visit[now] = true
        return dfs(start, arr[now])
    } else {
        if start == now {
            return true
        } else {
            return false
        }
    }
}

for i in 1...N {
    visit = Array(repeating: false, count: N+1)
    if dfs(i, i) {
        answer.append(i)
    }
}
print(answer.count)
print(answer.map { String($0) }.joined(separator: "\n"))
