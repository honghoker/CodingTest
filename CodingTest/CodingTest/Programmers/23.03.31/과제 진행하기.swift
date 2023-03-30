//  프로그래머스 - 과제 진행하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/176962
//  Created by 홍은표 on 2023/03/31.

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    var plans = plans.map { plan -> (String, Int, Int) in
        let time = plan[1].split(separator: ":").map { Int(String($0))! }
        let (hour, minute) = (time[0], time[1])
        return (plan[0], (hour * 60 + minute), Int(plan[2])!)
    }.sorted(by: { $0.1 > $1.1 })
    
    var pause = [(String, Int, Int)]()
    var answer = [String]()
    
    while !plans.isEmpty {
        if pause.isEmpty {
            let plan = plans.removeLast()
            pause.append(plan)
            continue
        }
        let current = plans.removeLast()
        let diff = current.1 - pause.last!.1
        if diff >= pause.last!.2 {
            var remainTime = diff - pause.last!.2
            answer.append(pause.removeLast().0)
            while remainTime > 0 && !pause.isEmpty {
                if pause.last!.2 > remainTime {
                    pause[pause.count - 1].2 = pause.last!.2 - remainTime
                    remainTime = 0
                } else {
                    remainTime -= pause.last!.2
                    answer.append(pause.removeLast().0)
                }
            }
        } else {
            pause[pause.count - 1].2 = pause.last!.2 - diff
        }
        pause.append(current)
    }
    return answer + pause.reversed().map { $0.0 }
}
