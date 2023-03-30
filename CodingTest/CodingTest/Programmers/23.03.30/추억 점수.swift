//  프로그래머스 - 추억 점수
//  https://school.programmers.co.kr/learn/courses/30/lessons/176963
//  Created by 홍은표 on 2023/03/30.

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (score[$1] ?? 0) } }
}
