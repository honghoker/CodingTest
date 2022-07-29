//
//  프린터.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/28.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var answer = 0
       
    var queue: [(Int, Int)] = priorities.enumerated().map { ($0.offset, $0.element) }
    var priorityQueue = priorities.sorted(by: >)
    
    while !queue.isEmpty {
        let front = queue.removeFirst()
        
        if front.1 == priorityQueue.first! {
            answer += 1
            
            if location == front.0 {
                break
            }
            
            priorityQueue.removeFirst()
        } else {
            queue.append(front)
        }
    }
    
    return answer
}
