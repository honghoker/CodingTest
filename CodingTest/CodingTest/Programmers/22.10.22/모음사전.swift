//  프로그래머스 - 모음사전
//  https://school.programmers.co.kr/learn/courses/30/lessons/84512
//  Created by 홍은표 on 2022/10/22.

import Foundation

func solution(_ word:String) -> Int {
    var words = ["A", "E", "I", "O", "U"]
    
    var count = 0
    var answer = 0
    func dfs(_ str: String) {
        if str == word  {
            answer = count
            return
        }
        count += 1
        if str.count == 5 { return }
        for i in 0..<words.count {
            dfs(str + words[i])
        }
    }
    dfs("")
    return answer
}
