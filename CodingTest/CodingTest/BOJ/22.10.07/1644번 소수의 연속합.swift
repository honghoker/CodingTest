//  백준 - 소수의 연속합
//  https://www.acmicpc.net/problem/1644
//  Created by 홍은표 on 2022/10/07.

import Foundation

let N = Int(readLine()!)!

func getPrimeNumber(_ end: Int) -> [Int] {
    var isPrime = Array(repeating: true, count: end+1)
    isPrime[0] = false; isPrime[1] = false
    
    for i in stride(from: 2, through: end, by: 1) {
        if isPrime[i] == false { continue }
        var j = i * 2
        while j <= end {
            isPrime[j] = false
            j += i
        }
    }
    
    return isPrime.enumerated().filter { $0.element == true }.map { $0.offset }
}

let arr = getPrimeNumber(N)
var left = 0, right = 0, sum = 2, answer = 0

while left < arr.count {
    if sum == N {
        answer += 1
        sum -= arr[left]
        left += 1
    } else if sum > N {
        sum -= arr[left]
        left += 1
    } else {
        guard right < arr.count - 1 else { break }
        right += 1
        sum += arr[right]
    }
}

print(answer)
