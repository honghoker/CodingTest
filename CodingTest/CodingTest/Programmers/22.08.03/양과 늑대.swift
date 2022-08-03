//
//  양과 늑대.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/03.
//

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var map = [Int: [Int]]()
    
    for edge in edges {
        map[edge[0], default: []].append(edge[1])
    }
    
    var answer = 0
    
    func dfs(_ visit: [Int], _ sheep: Int, _ wolf: Int) {
        for node in visit {
            let nextWolf = wolf + (info[node] == 0 ? 0 : 1)
            let nextSheep = sheep + (info[node] == 0 ? 1 : 0)
            
            guard nextSheep > nextWolf else {
                continue
            }
            
            answer = max(answer, nextSheep)
            
            var visit = visit
            let currentIndex = visit.firstIndex(of: node)!
            visit.remove(at: currentIndex)
            visit.append(contentsOf: map[node] ?? [])
            
            dfs(visit, nextSheep, nextWolf)
        }
    }
    
    dfs([0], 0, 0)
    
    return answer
}
