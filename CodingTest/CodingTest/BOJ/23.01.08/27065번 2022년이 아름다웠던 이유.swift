//  백준 - 2022년이 아름다웠던 이유
//  https://www.acmicpc.net/problem/27065
//  Created by 홍은표 on 2023/01/08.

import Foundation

var answer = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var sum = 0
    var arr = [Int]()
    for i in stride(from: 1, through: n/2, by: 1) where n % i == 0 {
        sum += i; arr.append(i)
    }
    if n >= sum { answer.write("BOJ 2022\n") }
    else {
        var isPossible = true
        for i in 0..<arr.count {
            var sum2 = 0
            for j in stride(from: 1, through: arr[i]/2, by: 1) where arr[i] % j == 0 {
                sum2 += j
            }
            if sum2 > arr[i] { isPossible = false; break }
        }
        answer.write(isPossible ? "Good Bye\n" : "BOJ 2022\n")
    }
}
print(answer)
