//  프로그래머스 - 베스트앨범
//  https://school.programmers.co.kr/learn/courses/30/lessons/42579
//  Created by 홍은표 on 2022/11/09.

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var total = [String: Int]()
    var map = [String: [(Int, Int)]]()
    var answer = [Int]()
    
    for i in 0..<genres.count {
        map[genres[i], default: []].append((i, plays[i]))
        total[genres[i], default: 0] += plays[i]
    }
    
    for m in total.sorted { $0.value > $1.value } {
        let sortedValue = map[m.key]!.sorted { $0.1 > $1.1 }
        if sortedValue.count >= 2 {
            answer += [sortedValue[0].0, sortedValue[1].0]
        } else {
            answer += [sortedValue[0].0]
        }
    }
    
    return answer
}
