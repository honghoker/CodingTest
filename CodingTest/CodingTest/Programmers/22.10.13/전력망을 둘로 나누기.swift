//  프로그래머스 - 전력망을 둘로 나누기
//  https://school.programmers.co.kr/learn/courses/30/lessons/86971
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree = [Int: [Int]]()
    
    for wire in wires {
        tree[wire[0], default: []].append(wire[1])
        tree[wire[1], default: []].append(wire[0])
    }
    var answer = Int.max

    func divide(_ key: Int, _ now: Int) {
        var tempTree = tree
        if let index = tempTree[now]!.firstIndex(of: key) {
            tempTree[now]!.remove(at: index)
        }
        if let index = tempTree[key]!.firstIndex(of: now) {
            tempTree[key]!.remove(at: index)
        }
        
        var queue = [now]
        var front = 0
        var visit = Array(repeating: false, count: n+1)
        visit[now] = true
        
        while front < queue.count {
            let node = queue[front]
            front += 1
            
            guard let nexts = tempTree[node] else { return }
            for next in nexts {
                if !visit[next] {
                    visit[next] = true
                    queue.append(next)
                }
            }
        }
        var count = visit.filter { $0 == true }.count
        answer = min(abs((n - count) - count), answer)
    }
    
    for key in tree.keys {
        for next in tree[key]! {
            divide(key, next)
        }
    }
    
    return answer
}
