//  프로그래머스 - 로또의 최고 순위와 최저 순위.swift
//  https://school.programmers.co.kr/learn/courses/30/lessons/77484
//  Created by 홍은표 on 2022/11/13.

import Foundation

func getRank(_ num: Int) -> Int {
    switch num {
        case 6: return 1
        case 5: return 2
        case 4: return 3
        case 3: return 4
        case 2: return 5
        default: return 6
    }
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var map = [Int: Bool]()
    win_nums.forEach { map[$0] = true }
    var answer = 0, count = 0
    for lotto in lottos {
        if lotto == 0 { count += 1; continue }
        if map[lotto] != nil { answer += 1 }
    }
    
    return [getRank(answer + count), getRank(answer)]
}
