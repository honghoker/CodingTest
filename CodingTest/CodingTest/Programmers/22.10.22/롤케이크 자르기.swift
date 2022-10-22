//  프로그래머스 - 롤케이크 자르기
//  https://school.programmers.co.kr/learn/courses/30/lessons/132265
//  Created by 홍은표 on 2022/10/22.

import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var me = [Int: Int](), brother = [Int: Int]()
    topping.forEach {
        me[$0, default: 0] += 1
    }
    
    topping.forEach {
        me[$0]! -= 1
        brother[$0, default: 0] += 1
        if me[$0]! == 0 { me[$0] = nil }
        if me.keys.count == brother.keys.count {
            answer += 1
        }
    }
    
    return answer
}
