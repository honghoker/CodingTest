//  백준 - 주식
//  https://www.acmicpc.net/problem/12014
//  Created by 홍은표 on 2022/12/12.

import Foundation

var answer = ""
func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if find > numbers[mid] { start = mid + 1 }
        else { end = mid }
    }
    return end
}

for t in 1...Int(readLine()!)! {
    answer.write("Case #\(t)\n")
    let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [arr[0]]
    
    for i in 1..<NK[0] {
        let index = lowerBound(arr[i], dp)
        if dp.count == index { dp.append(arr[i]) }
        else { dp[index] = arr[i] }
    }
    answer.write(NK[1] <= dp.count ? "1\n" : "0\n")
}
print(answer)

