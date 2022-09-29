//  프로그래머스 - 여행경로
//  https://school.programmers.co.kr/learn/courses/30/lessons/43164
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var answer = [String]()
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var visit = Array(repeating: false, count: tickets.count)
    
    func dfs(_ now: String) {
        if answer.count == tickets.count {
            answer.append(now)
            return
        }
        
        for i in 0..<tickets.count {
            if !visit[i] && tickets[i][0] == now {
                visit[i] = true
                answer.append(now)
                dfs(tickets[i][1])
                if answer.count == tickets.count + 1 {
                    return
                }
                visit[i] = false
                answer.removeLast()
            }
        }
    }
    
    dfs("ICN")
    
    return answer
}
