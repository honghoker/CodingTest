//  프로그래머스 - 기지국 설치
//  https://school.programmers.co.kr/learn/courses/30/lessons/12979
//  Created by 홍은표 on 2022/11/09.

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var index = 1
    
    for station in stations {
        answer += Int(ceil(Double(station - w - index) / Double(2 * w + 1)))
        index = station + w + 1
    }
    
    if index <= n {
        answer += Int(ceil(Double(n - index + 1) / Double(2 * w + 1)))
    }
    
    return answer
}
