//  프로그래머스 - 무지의 먹방 라이브
//  https://school.programmers.co.kr/learn/courses/30/lessons/42891
//  Created by 홍은표 on 2023/04/02.

import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var queue = [(Int, Int)]()
    var totalTime = 0
    food_times.enumerated().forEach { (index, time) in
        queue.append((index + 1, time))
        totalTime += time
    }
    if totalTime <= k { return -1 }
    
    var prevTime = 0, k = k
    var index = 0
    queue.sort(by: { $0.1 < $1.1 })
    
    while index < queue.count {
        let currentTime = queue[index].1
        let diffTime = currentTime - prevTime
        let requiredTime = Int64(diffTime * (queue.count - index))
        if k < requiredTime { break }
        k -= requiredTime
        prevTime = currentTime
        index += 1
    }
    
    let remainingQueue = queue[index...].map { $0 }.sorted { $0.0 < $1.0 }
    let nextIndex = k % Int64(remainingQueue.count)
    return remainingQueue[Int(nextIndex)].0
}
