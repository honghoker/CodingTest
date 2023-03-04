//  프로그래머스 - 점프와 순간 이동
//  https://school.programmers.co.kr/learn/courses/30/lessons/12980
//  Created by 홍은표 on 2023/03/05.

import Foundation

func solution(_ n:Int) -> Int {
    var answer = 1
    var n = n
    while n != 1 {
        if n % 2 == 0 { n /= 2 } else { n = (n - 1) / 2; answer += 1 }
    }
    return answer
}
