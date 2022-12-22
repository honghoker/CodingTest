//  백준 - 책정리
//  https://www.acmicpc.net/problem/1818
//  Created by 홍은표 on 2022/12/12.

import Foundation

let N = Int(readLine()!)!
let books = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [books[0]]

func lowerBound(_ find: Int, _ numbers: [Int]) -> Int {
    var start = 0, end = numbers.count
    while start < end {
        let mid = (start + end) / 2
        if find > numbers[mid] { start = mid + 1 }
        else { end = mid }
    }
    return end
}

for i in 1..<N {
    let index = lowerBound(books[i], dp)
    if dp.count == index { dp.append(books[i]) }
    else { dp[index] = books[i] }
}

print(N - dp.count)
