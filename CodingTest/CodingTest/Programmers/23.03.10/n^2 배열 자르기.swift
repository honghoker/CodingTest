//  프로그래머스 - n^2 배열 자르기
//  https://school.programmers.co.kr/learn/courses/30/lessons/87390
//  Created by 홍은표 on 2023/03/10.

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (left...right).map { max(Int($0) / n, Int($0) % n) + 1 }
}
