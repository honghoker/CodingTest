//
//  키패드 누르기.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/14.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var left = 10
    var right = 12
    
    var answer = ""
    for i in 0..<numbers.count {
        if [1, 4, 7].contains(numbers[i]) {
            answer += "L"
            left = numbers[i]
        } else if [3, 6, 9].contains(numbers[i]) {
            answer += "R"
            right = numbers[i]
        } else {
            let num = numbers[i] == 0 ? 11 : numbers[i]
            let leftAbs = abs(left - num)
            let rightAbs = abs(right - num)
            let leftDiff = leftAbs / 3 + leftAbs % 3
            let rightDiff = rightAbs / 3 + rightAbs % 3
            
            if leftDiff < rightDiff {
                answer += "L"
                left = num
            } else if leftDiff > rightDiff {
                answer += "R"
                right = num
            } else {
                if hand == "left" {
                    answer += "L"
                    left = num
                } else {
                    answer += "R"
                    right = num
                }
            }
        }
    }
    return answer
}
