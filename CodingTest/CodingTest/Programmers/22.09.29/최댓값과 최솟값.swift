//  프로그래머스 - 최댓값과 최솟값
//  https://school.programmers.co.kr/learn/courses/30/lessons/12939
//  Created by 홍은표 on 2022/09/29.

import Foundation

func solution(_ s:String) -> String {
    let s = s.split(separator: " ").map { Int(String($0))! }.sorted()
    return "\(s.first!) \(s.last!)"
}
