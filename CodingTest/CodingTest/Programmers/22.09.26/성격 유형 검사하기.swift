//  프로그래머스 - 성격 유형 검사하기
//  https://school.programmers.co.kr/learn/courses/30/lessons/118666
//  Created by 홍은표 on 2022/09/26.

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var map = [String: Int]()

    var table = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    
    for i in 0..<survey.count {
        let s = survey[i].map{String($0)}
        let score = choices[i]
        
        switch score {
            case 1: map[s[0], default: 0] += 3; break
            case 2: map[s[0], default: 0] += 2; break
            case 3: map[s[0], default: 0] += 1; break
            case 5: map[s[1], default: 0] += 1; break
            case 6: map[s[1], default: 0] += 2; break
            case 7: map[s[1], default: 0] += 3; break
            default: break
        }
    }
    
    var answer = ""
    for t in table {
        if map[t[0], default: 0] >= map[t[1], default: 0] {
            answer.append(t[0])
        } else {
            answer.append(t[1])
        }
    }
    
    return answer
}
