//
//  명예의 전당 (1).swift
//  CodingTest
//
//  Created by 홍은표 on 2022/11/25.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer = [Int]()
    var honor = [Int]()
    for i in 0..<score.count {
        if honor.count == k {
            if score[i] > honor.last! {
                honor.removeLast()
                honor.append(score[i])
            }
        } else {
            honor.append(score[i])
        }
        honor.sort(by: >)
        answer.append(honor.last!)
    }
    return answer
}
