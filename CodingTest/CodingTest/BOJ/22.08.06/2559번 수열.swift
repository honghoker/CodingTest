//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/06.
//
import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (NK[0], NK[1])
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var sum = arr[0...K-1].reduce(0, +)
var left = 1
var right = K
var answer = sum

while right < N {
    sum -= arr[left - 1]
    sum += arr[right]
    answer = max(answer, sum)
    left += 1
    right += 1
}

print(answer)
