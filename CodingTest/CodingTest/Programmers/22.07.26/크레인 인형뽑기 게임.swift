//
//  크레인 인형뽑기 게임.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/26.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var tempBoard = board
    var basket = [Int]()
    let length = board[0].count

    for i in 0..<moves.count {
        var s = moves[i] - 1
        var idx = 0
        while idx < length {
            if tempBoard[idx][s] == 0 {
                idx += 1
            } else {
                if !basket.isEmpty && basket.last! == tempBoard[idx][s] {
                    basket.removeLast()
                    answer += 1
                } else {
                    basket.append(tempBoard[idx][s])
                }
                tempBoard[idx][s] = 0
                break
            }
        }
    }
    
    return answer * 2
}
