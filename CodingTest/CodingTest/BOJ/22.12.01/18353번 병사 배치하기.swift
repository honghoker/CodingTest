//  백준 - 병사 배치하기
//  https://www.acmicpc.net/problem/18353
//  Created by 홍은표 on 2022/12/01.

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [arr[0]]

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if numbers[mid] > find { start = mid + 1 }
        else { end = mid }
    }
    return end
}

for i in 1..<N {
    let index = lowerBound(arr[i], dp)
    if dp.count == index { dp.append(arr[i]) }
    else { dp[index] = arr[i] }
}
print(N - dp.count)
