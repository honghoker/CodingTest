//  프로그래머스 - 콜라 문제
//  https://school.programmers.co.kr/learn/courses/30/lessons/132267
//  Created by 홍은표 on 2022/10/22.

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var n = n
    var answer = 0
    while n >= a {
        let take = (n / a * b)
        answer += take
        n = take + (n % a)
    }
    
    return answer
}
