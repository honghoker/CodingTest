//  프로그래머스 - 바탕화면 정리
//  https://school.programmers.co.kr/learn/courses/30/lessons/161990
//  Created by 홍은표 on 2023/03/03.

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var answer = [wallpaper.count, wallpaper[0].count, 0, 0]
    wallpaper.enumerated().forEach { i, paper in
        paper.enumerated().forEach { j, file in
            if file == "#" {
                answer[0] = min(i, answer[0])
                answer[1] = min(j, answer[1])
                answer[2] = max(i + 1, answer[2])
                answer[3] = max(j + 1, answer[3])
            }
        }
    }
    return answer
}
