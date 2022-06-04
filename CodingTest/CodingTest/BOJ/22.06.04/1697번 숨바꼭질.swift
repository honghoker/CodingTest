//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/03.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var arr = Array(repeating: 0, count: 100001)
var visit = Array(repeating: false, count: 100001)
visit[N] = true
var queue = [N]

while !queue.isEmpty {
    let node = queue.removeFirst()
    if node == K { break }
    
    if node < 100000 && visit[node + 1] == false {
        arr[node + 1] = arr[node] + 1
        queue.append(node + 1)
        visit[node + 1] = true
    }
    
    if node > 0 && visit[node - 1] == false {
        arr[node - 1] = arr[node] + 1
        queue.append(node - 1)
        visit[node - 1] = true
    }
    
    if node * 2 < 100001 && visit[node * 2] == false {
        arr[node * 2] = arr[node] + 1
        queue.append(node * 2)
        visit[node * 2] = true
    }
}

print(arr[K])
