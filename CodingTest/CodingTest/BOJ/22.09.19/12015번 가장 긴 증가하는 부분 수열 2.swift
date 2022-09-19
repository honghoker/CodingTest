//  백준 - 가장 긴 증가하는 부분 수열 2
//  https://www.acmicpc.net/problem/12015
//  Created by 홍은표 on 2022/09/19.

import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int]()

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        if numbers[mid] < find {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

for i in 0..<N {
    if dp.isEmpty {
        dp.append(A[i])
        continue
    }
    
    if dp[dp.count - 1] < A[i] {
        dp.append(A[i])
    } else {
        let index = lowerBound(A[i], dp)
        dp[index] = A[i]
    }
}

print(dp.count)
