//
//  징검다리 건너기.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/17.
//

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200_000_000
    
    while left < right {
        let mid = (left + right) / 2
        var count = 0
        
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                count += 1
                
                if count >= k {
                    break
                }
            } else {
                count = 0
            }
        }
        
        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
