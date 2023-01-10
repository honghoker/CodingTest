//  백준 - 마법의 엘리베이터
//  https://school.programmers.co.kr/learn/courses/30/lessons/148653
//  Created by 홍은표 on 2023/01/10.

import Foundation

func solution(_ storey:Int) -> Int {
    var arr = String(storey).reversed().map { Int(String($0))! }
    var answer = Int.max
    
    func dfs(_ index: Int, _ offset: Int, _ sum: Int) {
        if index == arr.count {
            answer = min(answer, sum + offset)
            return
        }
        let num = arr[index] + offset
        dfs(index + 1, 0, sum + num)
        dfs(index + 1, 1, sum + 10 - num)
    }
    
    dfs(0, 0, 0)
    return answer
}
