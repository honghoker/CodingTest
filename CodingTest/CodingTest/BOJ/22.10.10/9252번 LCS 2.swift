//  백준 - LCS 2
//  https://www.acmicpc.net/problem/9252
//  Created by 홍은표 on 2022/10/10.

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

var answer = ""
var i = A.count, j = B.count

while lcs[i][j] != 0 {
    if A[i-1] == B[j-1] {
        answer.append(A[i-1])
        i -= 1; j -= 1
    } else {
        if lcs[i-1][j] > lcs[i][j-1] { i -= 1 }
        else { j -= 1 }
    }
}
print(lcs[A.count][B.count])
print(answer.reversed().map{String($0)}.joined())
