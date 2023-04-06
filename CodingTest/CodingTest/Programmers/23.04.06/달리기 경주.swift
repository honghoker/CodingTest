//  프로그래머스 - 달리기 경주
//  https://school.programmers.co.kr/learn/courses/30/lessons/178871
//  Created by 홍은표 on 2023/04/07.

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var numberMap = Dictionary(uniqueKeysWithValues: players.enumerated().map { ($1, $0) })
    callings.forEach {
        let index = numberMap[$0]!
        let prev = players[index - 1]
        players.swapAt(index, index - 1)
        numberMap[$0] = index - 1
        numberMap[prev] = index
    }
    return players
}
