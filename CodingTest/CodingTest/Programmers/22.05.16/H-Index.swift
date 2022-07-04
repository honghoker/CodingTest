//
//  H-Index.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/15.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var result = -1
    
    for i in citations.indices {
        let value = citations[i]
        let h = i + 1
        
        if h > value {
            result = i
            break
        }
    }
    
    if result == -1 {
        return citations.count
    }
    
    return result
}

print(solution([5, 5, 5, 5, 5]))
