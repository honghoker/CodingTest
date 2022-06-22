//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var A = [[Int]]()
var B = [[Int]]()
var answer = 0

func flip(_ x: Int, _ y: Int) {
    answer += 1
    for i in 0..<3 {
        for j in 0..<3 {
            if A[x+i][y+j] == 0 { A[x+i][y+j] = 1 }
            else { A[x+i][y+j] = 0 }
        }
    }
}

for _ in 0..<N {
    A.append( readLine()!.map { Int(String($0))! } )
}
for _ in 0..<N {
    B.append( readLine()!.map { Int(String($0))! } )
}

for i in stride(from:0, through: N-3, by: 1){
    for j in stride(from:0, through: M-3, by: 1) {
        if A[i][j] != B[i][j] {
            flip(i, j)
        }
    }
}

for i in 0..<N {
    for j in 0..<M {
        if A[i][j] != B[i][j] {
            answer = -1
            break
        }
    }
}

print(answer)
