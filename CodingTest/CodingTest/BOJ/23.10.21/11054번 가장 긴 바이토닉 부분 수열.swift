//  백준 - 가장 긴 바이토닉 부분 수열
//  https://www.acmicpc.net/problem/11054
//  Created by 홍은표 on 23/10/21.

import Foundation

let N = Int(readLine()!)!, A = readLine()!.split(separator: " ").map { Int(String($0))! }

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if numbers[mid] < find { start = mid + 1 }
        else { end = mid }
    }
    return end
}

func getLis(_ A: [Int]) -> [Int] {
    var dp = [Int](), l = [Int](repeating: 0, count: N)
    for i in 0..<N {
        let index = lowerBound(A[i], dp)
        if index == dp.count { dp.append(A[i]) }
        else { dp[index] = A[i] }
        l[i] = index + 1
    }
    return l
}

let lis = getLis(A)
let lds = getLis(A.reversed()).reversed()
print(zip(lis, lds).map(+).max()! - 1)
