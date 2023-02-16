//  프로그래머스 - 카드 뭉치
//  https://school.programmers.co.kr/learn/courses/30/lessons/159994
//  Created by 홍은표 on 2023/02/16.

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var front1 = 0, front2 = 0
    
    for str in goal {
        if front1 < cards1.count && cards1[front1] == str {
            front1 += 1
        } else if front2 < cards2.count && cards2[front2] == str {
            front2 += 1
        } else {
            return "No"
        }
    }
    
    return "Yes"
}
