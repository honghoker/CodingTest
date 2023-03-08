//  프로그래머스 - 이모티콘 할인행사
//  https://school.programmers.co.kr/learn/courses/30/lessons/150368
//  Created by 홍은표 on 2023/03/09.

import Foundation

func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
    var answer = [0, 0]
    var discounts = [[Int]]()
    
    // O(4^m)
    func dfs(_ arr: [Int] = []) {
        if arr.count == emoticons.count {
            discounts.append(arr); return
        }
        for d in [10, 20, 30, 40] { dfs(arr + [d]) }
    }
    dfs()
    
    for discount in discounts {
        var temp = [0, 0]
        for user in users {
            var money = 0
            for (i, emoticon) in emoticons.enumerated() {
                if user[0] <= discount[i] {
                    money += ((emoticon * (100 - discount[i])) / 100)
                }
            }
            if user[1] <= money { temp[0] += 1 }
            else { temp[1] += money }
        }
        if answer[0] < temp[0] { answer = temp }
        else if answer[0] == temp[0] && answer[1] < temp[1] { answer = temp }
    }
    
    return answer
}
