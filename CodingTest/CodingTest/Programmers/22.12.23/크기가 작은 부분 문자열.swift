//  프로그래머스 - 크기가 작은 부분 문자열
//  https://school.programmers.co.kr/learn/courses/30/lessons/147355
//  Created by 홍은표 on 2022/12/23.

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let length = p.count
    var t = t.map { String($0) } , p = Int(p)!
    var left = 0, right = length - 1
    var answer = 0
    var subNum = Int(t[left...right].map { String($0) }.joined())!
    
    while true {
        if subNum <= p { answer += 1 }
        
        var minus = Int(t[left])!
        if length != 1 { minus *= Int(pow(10, Double(length - 1))) }
        subNum -= minus
        
        left += 1; right += 1
        if right == t.count { break }
        var plus = Int(t[right])!
        subNum = (subNum * 10) + plus
    }
    
    return answer
}
