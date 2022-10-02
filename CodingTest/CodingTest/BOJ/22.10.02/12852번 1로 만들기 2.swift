//  백준 - 1로 만들기 2
//  https://www.acmicpc.net/problem/12852
//  Created by 홍은표 on 2022/10/02.

import Foundation

var N = Int(readLine()!)!

var queue = [(N, 0, [N])]
var visit = [Int: Bool]()
var front = 0

while front < queue.count {
    let node = queue[front]
    front += 1
    if node.0 == 1 { print(node.1); print(node.2.map { String($0) }.joined(separator: " ")); break }
    
    if node.0 % 3 == 0 && visit[node.0 / 3] == nil {
        visit[node.0 / 3] = true
        queue.append( (node.0 / 3, node.1 + 1, node.2 + [(node.0 / 3)]) )
    }
    if node.0 % 2 == 0 && visit[node.0 / 2] == nil {
        visit[node.0 / 2] = true
        queue.append( (node.0 / 2, node.1 + 1, node.2 + [(node.0 / 2)]) )
    }
    if visit[node.0 - 1] == nil {
        visit[node.0 - 1] = true
        queue.append((node.0 - 1, node.1 + 1, node.2 + [(node.0 - 1)]))
    }
}
