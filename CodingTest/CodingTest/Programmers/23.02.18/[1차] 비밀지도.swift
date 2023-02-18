//  프로그래머스 - [1차] 비밀지도
//  https://school.programmers.co.kr/learn/courses/30/lessons/17681
//  Created by 홍은표 on 2023/02/18.

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let arr = [arr1, arr2].map {
        $0.map {
            let str = String($0, radix: 2).map { String($0) }
            return Array(repeating: "0", count: n - str.count) + str
        }
    }
    return zip(arr[0], arr[1]).map { zip($0, $1).map { $0 == "1" || $1 == "1" ? "#" : " " }.joined() }
}
