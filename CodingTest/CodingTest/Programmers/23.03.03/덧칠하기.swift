//  프로그래머스 -덧칠하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/161989
//  Created by 홍은표 on 2023/03/03.

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var idx = 0
    var answer = 0
    while !section.isEmpty {
        idx = section.removeLast() - m; answer += 1
        while !section.isEmpty && section.last! > idx {
            section.removeLast()
        }
    }
    
    return answer
}
