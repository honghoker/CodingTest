//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/25.
//

import Foundation

let n = Int(readLine()!)!
if n == 1 { print(0) }
else {
    var tree = [Int: [(node: Int, cost: Int)]]()

    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[input[0], default: []].append((node: input[1], cost: input[2]))
        tree[input[1], default: []].append((node: input[0], cost: input[2]))
    }

    var visit = [Int: Bool]()
    var maxNode = 0
    var maxLength = 0

    func dfs(_ node: Int, _ depth: Int) {
        visit[node] = true
        
        if maxLength < depth {
            maxLength = depth
            maxNode = node
        }
        
        for next in tree[node]! {
            if visit[next.node, default: false] == false {
                dfs(next.node, depth + next.cost)
            }
        }
    }

    dfs(1, 0) // root에서 가장 긴 노드 찾기
    maxLength = 0
    visit = [Int: Bool]()
    dfs(maxNode, 0) // 가장 긴 노드 기준에서 가장 먼 노드 찾기

    print(maxLength)
}
