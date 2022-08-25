//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/25.
//

import Foundation

let V = Int(readLine()!)!
var tree = [Int: [(node: Int, cost: Int)]]()

for _ in 0..<V {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    var idx = 1
    while true {
        if input[idx] == -1 { break }
        tree[input[0], default: []].append((node: input[idx], cost: input[idx+1]))
        idx += 2
    }
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

dfs(1, 0)
maxLength = 0
visit = [Int: Bool]()
dfs(maxNode, 0)

print(maxLength)
