//  프로그래머스 - 숫자 변환하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/154538
//  Created by 홍은표 on 2023/01/26.

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var queue: [(Int, Int)] = [(x, 0)]
    var front = 0
    var answer = -1
    var visit = Set<Int>()
    while front < queue.count {
        let (num, count) = queue[front]
        front += 1
        if num == y { answer = count; break }
        if num > y { continue }
        
        if !visit.contains(num + n) {
            queue.append((num + n, count + 1))
            visit.insert(num + n)
        }
        if !visit.contains(num * 2) {
            queue.append((num * 2, count + 1))
            visit.insert(num * 2)
        }
        
        queue.append((num * 3, count + 1))
    }
    
    return answer
}
