//
//  수들의 합 2.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/06.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])
let A = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = 0
var left = 0
var right = 0
var sum = A[0]
while left < A.count && right < A.count {
    if sum > M {
        sum -= A[left]
        left += 1
        continue
    }
    if sum == M { answer += 1 }
    right += 1
    if right < A.count { sum += A[right] }
}
print(answer)
