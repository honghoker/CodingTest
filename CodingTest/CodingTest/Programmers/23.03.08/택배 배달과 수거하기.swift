//  프로그래머스 - 택배 배달과 수거하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/150369
//  Created by 홍은표 on 2023/03/08.

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer: Int64 = 0
    var deliveries = deliveries, pickups = pickups
    
    func calc(_ arr: inout [Int]) -> Bool {
        var sum = 0
        while !arr.isEmpty, sum <= cap {
            sum += arr.removeLast()
        }
        if sum == 0 { return false }
        if sum > cap { arr.append(abs(sum - cap)) }
        return true
    }
    
    while !deliveries.isEmpty || !pickups.isEmpty {
        let temp = Int64(max(deliveries.count, pickups.count)) * 2
        let dR = calc(&deliveries), pR = calc(&pickups)
        if dR || pR { answer += temp }
    }
    return answer
}
