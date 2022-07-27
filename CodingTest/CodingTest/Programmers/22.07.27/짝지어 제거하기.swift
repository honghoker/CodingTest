//
//  짝지어 제거하기.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/27.
//

import Foundation

func solution(_ s:String) -> Int {
    var stack = [Character]()
    var str = Array(s)
    
    for i in 0..<str.count {
        if stack.isEmpty { stack.append(str[i]) }
        else {
            if stack.last! == str[i] { stack.removeLast() }
            else { stack.append(str[i]) }
        }
    }

    return stack.isEmpty ? 1 : 0
}
