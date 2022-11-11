//  프로그래머스 - 이중우선순위큐
//  https://school.programmers.co.kr/learn/courses/30/lessons/42628
//  Created by 홍은표 on 2022/11/11.

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    operations.forEach {
        let op = $0.split(separator: " ").map { $0 }
        if op[0] == "I" {
            queue.append(Int(op[1])!)
        } else {
            if let index = queue.firstIndex { $0 == ((Int(op[1])! == 1) ? queue.max()! : queue.min()!) } {
                queue.remove(at: index)
            }
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}
