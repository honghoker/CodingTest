//  프로그래머스 - 이진 변환 반복하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/70129
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ s:String) -> [Int] {
    var changeCount = 0
    var removedZero = 0
    var s = s
    
    func removeZero() {
        let beforeCount = s.count
        s = s.filter { $0 == "1" }
        removedZero += beforeCount - s.count
    }
    
    func calc() {
        s = String(s.count, radix: 2)
        changeCount += 1
    }
    
    while s != "1" {
        removeZero()
        calc()
    }
    
    return [changeCount, removedZero]
}
