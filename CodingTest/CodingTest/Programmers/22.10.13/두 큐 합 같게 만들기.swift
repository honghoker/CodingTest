//  프로그래머스 - 두 큐 합 같게 만들기
//  https://school.programmers.co.kr/learn/courses/30/lessons/118667
//  Created by 홍은표 on 2022/10/13.

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1Sum = queue1.reduce(0, +)
    var queue2Sum = queue2.reduce(0, +)
    
    if (queue1Sum + queue2Sum) % 2 != 0 { return -1 }
    let purpose = (queue1Sum + queue2Sum) / 2
    
    let arr = queue1 + queue2
    var left = 0
    var right = queue1.count
    var answer = 0
    
    while right < arr.count && left <= right {
        if queue1Sum == purpose { break }
        if queue1Sum < purpose {
            queue1Sum += arr[right]
            right += 1
        } else {
            queue1Sum -= arr[left]
            left += 1
        }
        answer += 1
    }
    
    if queue1Sum != purpose {
        return -1
    }
    
    return answer
}
