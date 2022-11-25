//  프로그래머스 - 귤 고르기
//  https://school.programmers.co.kr/learn/courses/30/lessons/138476
//  Created by 홍은표 on 2022/11/25.

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var map = [Int: Int]()
    tangerine.forEach { map[$0, default: 0] += 1 }
    
    var idx = 0, sum = 0
    
    for tanger in map.sorted { $0.value > $1.value } {
        sum += tanger.value; idx += 1
        if sum >= k { break }
    }
    
    return idx
}
