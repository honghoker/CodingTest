//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (M, N) = (input[0], input[1])

primeNumberSieve(M, N)

func primeNumberSieve(_ start: Int, _ end: Int) { // 에라토스테네스의 체
    var arr = Array(repeating: 0, count: end+1)
    for i in stride(from: 2, through: end, by: 1) {
        arr[i] = i
    }

    for i in stride(from: 2, through: end, by: 1) {
        if arr[i] == 0 { continue }
        for j in stride(from: i+i, through: end, by: i) {
            arr[j] = 0
        }
    }

    for i in stride(from: start, through: end, by: 1) {
        if arr[i] != 0 { print(arr[i]) }
    }
}

//import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (M, N) = (input[0], input[1])
//
//let sqrtValue = sqrt(Double(N))
//
//for i in M...N {
//    let result = isPriveNumber(i)
//    if result == true {
//        print(i)
//    }
//}
//
//func isPriveNumber(_ x: Int) -> Bool {
//    let end = Int(sqrt(Double(x)))
//    for i in stride(from: 2, through: end, by: 1) {
//        if x % i == 0 {
//            return false
//        }
//    }
//    return true
//}

