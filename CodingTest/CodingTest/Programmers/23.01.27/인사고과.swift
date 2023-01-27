//  프로그래머스 - 인사고과
//  https://school.programmers.co.kr/learn/courses/30/lessons/152995
//  Created by 홍은표 on 2023/01/27.

import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let wanho = scores[0]
    let wanhoSum = wanho[0] + wanho[1]
    var answer = 1, maxScore = 0
    
    let scores = scores.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] > $1[0]   }
    
    for score in scores {
        // 현재 사원의 동료평가 점수가 앞 사원들의 제일 높은 동료평가 점수보다 낮을 경우
        if score[1] < maxScore {
            // 완호라면 인센티브를 받지 못함
            if score == wanho { return -1 }
        } else {
            // 현재, 앞 사원들의 동료평가 점수 중 제일 높은 점수
            maxScore = max(score[1], maxScore)
            // 현재 사원이 완호의 점수합 보다 높을 경우 완호의 석차 증가
            if score[0] + score[1] > wanhoSum {
                answer += 1
            }
        }
    }
    
    return answer
}
