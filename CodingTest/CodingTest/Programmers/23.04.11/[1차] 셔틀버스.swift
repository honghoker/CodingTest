//  프로그래머스 - [1차] 셔틀버스
//  https://school.programmers.co.kr/learn/courses/30/lessons/17678
//  Created by 홍은표 on 2023/04/11.

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var timetable = timetable.map { t -> Int in
        let time = t.split(separator: ":").map { Int(String($0))! }
        return time[0] * 60 + time[1]
    }.sorted(by: >)
    
    func convertTime(_ time: Int) -> String {
        let hour = time / 60
        let minute = time % 60
        return String(format: "%02d:%02d", hour, minute)
    }
    
    var answer = "", time = 60 * 9
    
    for i in 1...n {
        if i == n {
            if timetable.count < m { answer = convertTime(time) }
            else {
                timetable.removeLast(m-1)
                answer = convertTime(min(timetable.last!-1, time))
            }
        }
        var idx = 0
        while idx < m, let last = timetable.last {
            guard time >= last else { break }
            timetable.removeLast()
            idx += 1
        }
        time += t
    }
    return answer
}
