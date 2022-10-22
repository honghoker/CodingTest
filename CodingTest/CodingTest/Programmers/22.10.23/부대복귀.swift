//  프로그래머스 - 부대복귀
//  https://school.programmers.co.kr/learn/courses/30/lessons/132266
//  Created by 홍은표 on 2022/10/23.

import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var map = [Int: [Int]]()
    var dist = [Int: Int]()
    for road in roads {
        map[road[0], default: []].append(road[1])
        map[road[1], default: []].append(road[0])
    }
    
    func getDistance() {
        var queue = [(destination, 0)]
        var front = 0
        var visit = Array(repeating: false, count: n+1)
        visit[destination] = true
        
        while front < queue.count {
            let node = queue[front]
            front += 1
            dist[node.0] = node.1
            guard let nexts = map[node.0] else { dist[node.0] = -1; return }
            for next in nexts {
                if !visit[next] {
                    visit[next] = true
                    queue.append((next, node.1 + 1))
                }
            }
        }
    }
    
    getDistance()
    var answer = [Int]()
    for source in sources {
        if let dist = dist[source] { answer.append(dist) }
        else { answer.append(-1) }
    }
    return answer
}
