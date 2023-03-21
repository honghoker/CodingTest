//  프로그래머스 - 다리를 지나는 트럭
//  https://school.programmers.co.kr/learn/courses/30/lessons/42583
//  Created by 홍은표 on 2023/03/21.

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights, n = trucks.count
    var arrivalTimes: [Int] = []
    var left = 0, right = 0
    var answer = 0, sum = 0
    
    while left < n {
        answer += 1
        
        if let arrivalTime = arrivalTimes.first, answer >= arrivalTime {
            arrivalTimes.removeFirst()
            sum -= trucks[left]
            left += 1
        }
        
        if right < n && sum + trucks[right] <= weight {
            sum += trucks[right]
            arrivalTimes.append(answer + bridge_length)
            right += 1
        }
    }
    
    return answer
}
