//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var queue = [(N, 0)]
var visit = Array(repeating: false, count: 100001)
visit[N] = true

while !queue.isEmpty {
    let node =  queue.removeFirst()
    let x = node.0
    let dist = node.1
    
    if x == K {
        print(dist)
        break
    }
        
    if x * 2 <= 100000 && visit[x * 2] == false {
        queue.append((x * 2, dist))
        visit[x * 2] = true
    }
    if x - 1 >= 0 && visit[x - 1] == false  {
        queue.append((x - 1, dist + 1))
        visit[x - 1] = true
    }
    if x + 1 <= 100000 && visit[x + 1] == false  {
        queue.append((x + 1, dist + 1))
        visit[x + 1] = true
    }
}
