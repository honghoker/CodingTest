//  백준 - 민균이의 계략
//  https://www.acmicpc.net/problem/11568
//  Created by 홍은표 on 2022/12/11.

import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [cards[0]]

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
    let index = lowerBound(cards[i], dp)
    if dp.count == index { dp.append(cards[i]) }
    else { dp[index] = cards[i] }
}

print(dp.count)
