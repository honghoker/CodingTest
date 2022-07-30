//
//  실패율.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/30.
//
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var answer = [Int: Float]()
    var player = stages.count

    for i in 1...N {
        let n = stages.filter { $0 == i }.count
        answer[i] = Float(-n) / Float(player)
        player -= n
    }

    return answer.sorted(by: <).sorted{ $0.value < $1.value }.map { $0.key }

    // swift의 sort가 unstable하다는 단점
    // 요소 각각에 -를 붙여서 음수로 만들고 sort 하면 stable 해짐
//     var current: Double = Double(stages.count)
//     var beforeAnswer = [(Double, Int)]()
//     var answer: Array<Int> = []
    
//     for number in 1...N {
//         var count: Double = 0
//         for index in 0..<stages.count {
//             if stages[index] == number {
//                 count = count + 1
//             }
//         }
//         beforeAnswer.append((-count / current, number))
//         current -= count
//     }
    
//     beforeAnswer = beforeAnswer.sorted(by: {$0 < $1 })
//     answer = beforeAnswer.map{$0.1}
    
//     return answer
}
