//  프로그래머스 - 개인정보 수집 유효기간
//  https://school.programmers.co.kr/learn/courses/30/lessons/150370
//  Created by 홍은표 on 2023/01/11.

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answer = [Int](), termsMap = [String: Int]()
    
    terms.forEach {
        let term = $0.split(separator: " ").map { $0 }
        termsMap[String(term[0])] = Int(term[1])!
    }
    
    func dayToInt(_ year: Int, _ month: Int, _ day: Int) -> Int {
        return year * 28 * 12 + month * 28 + day
    }

    let t = today.split(separator: ".").map { Int($0)! }
    let todayValue = dayToInt(t[0], t[1], t[2])

    privacies.enumerated().forEach {
        let index = $0.offset + 1
        let privacie = $0.element.split(separator: " ").map { $0 }
        var day = privacie[0].split(separator: ".").map { Int(String($0))! }
        let term = String(privacie[1])
        day[1] += termsMap[term]!

        if todayValue >= dayToInt(day[0], day[1], day[2]) {
            answer.append(index)
        }
    }
    
    return answer
}
