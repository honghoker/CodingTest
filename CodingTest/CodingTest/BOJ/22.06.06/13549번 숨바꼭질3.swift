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

var front = 0
while front < queue.count {
    let node = queue[front]
    front += 1
    let x = node.0
    let time = node.1
    if x == K { print(time); break }
    
    if x * 2 <= 100000 && visit[x * 2] == false {
        visit[x * 2] = true
        queue.append((x * 2, time))
    }
    if x - 1 >= 0 && visit[x - 1] == false {
        visit[x - 1] = true
        queue.append((x - 1, time + 1))
    }
    if x + 1 <= 100000 && visit[x + 1] == false {
        visit[x + 1] = true
        queue.append((x + 1, time + 1))
    }
}
