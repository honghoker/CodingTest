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
    
    print("@@@@@@ for x : \(x), dist : \(dist)")
    
    if x == K {
        print(dist)
        break
    }
    
    let nexts = [x + 1, x - 1, x * 2]
    
    
    
    for i in 0..<3 {
        if nexts[i] >= 0 && nexts[i] <= 100000 && visit[nexts[i]] == false {
            if i == 2 { // 순간이동
                queue.append((nexts[i], dist))
                visit[nexts[i]] = true
                print("@@@@@@ if 2 nexts[i] : \(nexts[i]), dist : \(dist)")
            } else {
                queue.append((nexts[i], dist + 1))
                visit[nexts[i]] = true
                print("@@@@@@ if 1 nexts[i] : \(nexts[i]), dist : \(dist + 1)")
            }
        }
    }
}
