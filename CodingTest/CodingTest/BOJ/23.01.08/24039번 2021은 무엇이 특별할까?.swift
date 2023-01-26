//  백준 - 2021은 무엇이 특별할까?
//  https://www.acmicpc.net/problem/24039
//  Created by 홍은표 on 2023/01/08.

import Foundation

let N = Int(readLine()!)!
var primeNumbers = [Int]()
var specialNumbers = [Int]()

func primeNumberSieve(_ start: Int, _ end: Int) { // 에라토스테네스의 체
    var arr = Array(repeating: 0, count: end+1)
    for i in stride(from: 2, through: end, by: 1) {
        arr[i] = i
    }

    for i in stride(from: 2, through: end, by: 1) where arr[i] != 0 {
        for j in stride(from: i+i, through: end, by: i) {
            arr[j] = 0
        }
    }

    for i in stride(from: start, through: end, by: 1) where arr[i] != 0 {
        primeNumbers.append(arr[i])
    }
}
primeNumberSieve(2, 103)
for i in 0..<primeNumbers.count - 1 { specialNumbers.append(primeNumbers[i] * primeNumbers[i+1])
}
print(specialNumbers.first(where: { $0 > N })!)
