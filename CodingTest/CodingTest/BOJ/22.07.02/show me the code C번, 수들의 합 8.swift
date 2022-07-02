//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

//import Foundation
// show me the code C번, 수들의 합 8

let N = Int(readLine()!)!

var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var b = readLine()!.split(separator: " ").map { Int(String($0))! }
var dpA = Array(repeating: Array(repeating: 0, count: N), count: N)
//var dpA = [Int: [Int]]
var dpB = Array(repeating: Array(repeating: 0, count: N), count: N)
for i in 0..<N {
    dpA[i][0] = a[i]
//    dpA[i] = [a[i]]
    dpB[i][0] = b[i]
}
var answer: Int64 = 0

if dpA[0][0] == dpB[0][0] {
    answer += 1
}

func dfs(_ now: Int, _ str: String, _ depth: Int) {
    if depth == 2 {
        let se = str.split(separator: " ").map { Int(String($0))! }
        let x = se[0]
        let y = se[1]

        if y-1 >= 0 {
            if x == y {
                dpA[x][y] = a[y]
                dpB[x][y] = b[y]
            }
            else {
                dpA[x][y] = dpA[x][y-1] + a[y]
                dpB[x][y] = dpB[x][y-1] + b[y]
            }
            if dpA[x][y] == dpB[x][y] { answer += 1}
        }
        return
    }
    
    for i in now..<N {
        dfs(i, str + "\(i) ", depth + 1)
    }
}

dfs(0, "", 0)

print(answer)
