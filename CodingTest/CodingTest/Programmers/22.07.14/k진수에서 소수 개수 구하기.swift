//
//  k진수에서 소수 개수 구하기.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/15.
//

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    // 소수 구하는법
    // var n = n
    // var numberArr = [Int]()
    // while n != 0 {
    //     numberArr.append(n % k)
    //     n /= k
    // }
    // let number = numberArr.reversed().map { String($0) }
    
    let number = String(n, radix: k).split(separator: "0").map { Int($0)! }
    let oneLess = number.filter { $0 != 1 }
    var answer = 0
    for num in oneLess {
        var prime = true
        for i in 2...Int(sqrt(Double(num))) + 1 {
            if num % i == 0 && num != i {
                prime = false
                break
            }
        }
        if prime {
            answer += 1
        }
    }
    
    return answer
}
