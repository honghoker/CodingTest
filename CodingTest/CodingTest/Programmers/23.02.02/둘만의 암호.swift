//  프로그래머스 - 둘만의 암호
//  https://school.programmers.co.kr/learn/courses/30/lessons/155652
//  Created by 홍은표 on 2023/02/02.

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer = ""
    var exist = Set<Int>()
    
    skip.forEach { exist.insert(Int($0.asciiValue!)) }
    s.forEach {
        var idx = 0
        var nextCh = Int($0.asciiValue!)
        while idx < index {
            nextCh += 1
            if nextCh > 122 { nextCh = 97 }
            if !exist.contains(nextCh) { idx += 1 }
        }
        answer.write(String(UnicodeScalar(nextCh)!))
    }
    
    return answer
}
