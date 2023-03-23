//  프로그래머스 - 광물 캐기
//  https://school.programmers.co.kr/learn/courses/30/lessons/172927
//  Created by 홍은표 on 2023/03/23.

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks = picks
    let cost = [
        0: ["diamond": 1, "iron": 1, "stone": 1],
        1: ["diamond": 5, "iron": 1, "stone": 1],
        2: ["diamond": 25, "iron": 5, "stone": 1]
    ]
    
    func calculateCost(_ idx: Int, _ pick: Int) -> Int {
        var sum = 0
        for i in idx..<min(idx + 5, minerals.count) {
            sum += cost[pick]![minerals[i]]!
        }
        return sum
    }
    
    func dfs(_ idx: Int) -> Int {
        if idx >= minerals.count { return 0 }
        var minCost = Int.max
        for i in 0..<3 {
            if picks[i] > 0 {
                picks[i] -= 1
                let currentCost = calculateCost(idx, i) + dfs(idx + 5)
                minCost = min(minCost, currentCost)
                picks[i] += 1
            }
        }
        return minCost == Int.max ? 0 : minCost
    }
    
    return dfs(0)
}
