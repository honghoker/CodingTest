//  백준 - 전구와 스위치
//  https://www.acmicpc.net/problem/2138
//  Created by 홍은표 on 2022/09/24.

import Foundation

let N = Int(readLine()!)!
let start = readLine()!.map { String($0) }
let end = readLine()!.map { String($0) }

var answer = Int.max
var count = 0
var temp = [String]()

func solve(_ first: Int) {
    temp = start
    count = 0
    if first == 0 {
        temp[0] = temp[0] == "1" ? "0" : "1"
        temp[1] = temp[1] == "1" ? "0" : "1"
        count += 1
    }
    
    for i in 1..<N {
        if temp[i-1] != end[i-1] {
            temp[i-1] = temp[i-1] == "1" ? "0" : "1"
            temp[i] = temp[i] == "1" ? "0" : "1"
            if i + 1 < N { temp[i + 1] = temp[i + 1] == "1" ? "0" : "1" }
            
            count += 1
        }
    }
    
    if temp == end {
        answer = min(count, answer)
    }
}

solve(0)
solve(1)

print(answer == Int.max ? -1 : answer)
