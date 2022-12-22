//  프로그래머스 - 테이블 해시 함수
//  https://school.programmers.co.kr/learn/courses/30/lessons/147354
//  Created by 홍은표 on 2022/12/23.

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var data = data.sorted { $0[col-1] == $1[col-1] ? $0[0] > $1[0] : $0[col-1] < $1[col-1] }
    var numbers = [Int]()
    for mod in row_begin-1...row_end-1 { numbers.append(data[mod].map { $0 % (mod + 1) }.reduce(0, +)) }
    return numbers.reduce(0, ^)
}
