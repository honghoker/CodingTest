//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/11.
//

import Foundation

let A = readLine()!.map{ String($0) }
let B = readLine()!.map{ String($0) }

var lcs = Array(repeating: Array(repeating: 0, count: B.count + 1), count: A.count + 1)

for i in 1...A.count {
    for j in 1...B.count {
        if B[j-1] == A[i-1] {
            lcs[i][j] = lcs[i-1][j-1] + 1
        } else {
            lcs[i][j] = max(lcs[i-1][j], lcs[i][j-1])
        }
    }
}

print(lcs[A.count][B.count])
