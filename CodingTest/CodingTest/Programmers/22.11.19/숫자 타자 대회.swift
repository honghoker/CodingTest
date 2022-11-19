//  프로그래머스 - 숫자 타자 대회
//  https://school.programmers.co.kr/learn/courses/30/lessons/136797
//  Created by 홍은표 on 2022/11/19.

import Foundation

func solution(_ numbers:String) -> Int {
    let dist = [
      // 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
        [1, 7, 6, 7, 5, 4, 5, 3, 2, 3], // 0
        [7, 1, 2, 4, 2, 3, 5, 4, 5, 6], // 1
        [6, 2, 1, 2, 3, 2, 3, 5, 4, 5], // 2
        [7, 4, 2, 1, 5, 3, 2, 6, 5, 4], // 3
        [5, 2, 3, 5, 1, 2, 4, 2, 3, 5], // 4
        [4, 3, 2, 3, 2, 1, 2, 3, 2, 3], // 5
        [5, 5, 3, 2, 4, 2, 1, 5, 3, 2], // 6
        [3, 4, 5, 6, 2, 3, 5, 1, 2, 4], // 7
        [2, 5, 4, 5, 3, 2, 3, 2, 1, 2], // 8
        [3, 6, 5, 4, 5, 3, 2, 4, 2, 1], // 9
    ]
    
    func update(_ map: [[Int]: Int], _ number: Int) -> [[Int]: Int] {
        var newMap = [[Int]: Int]()

        for (hands, wgt) in map {
            if hands[0] == number || hands[1] == number {
                newMap[hands] = min(newMap[hands, default: Int.max], wgt + 1)
            } else {
                newMap[[hands[0], number]] = min(newMap[[hands[0], number], default: Int.max], wgt + dist[hands[1]][number])
                newMap[[hands[1], number]] = min(newMap[[hands[1], number], default: Int.max], wgt + dist[hands[0]][number])
            }
        }

        return newMap
    }
    
    var map = [[4, 6]: 0]

    for number in numbers {
        map = update(map, Int(String(number))!)
    }
    
    return map.values.min()!
}

print("answer :", solution("1756") == 10)     // 10
print("answer :", solution("5123") == 8)     // 8
print("answer :", solution("5") == 2)        // 2
print("answer :", solution("55555") == 6)    // 6
print("answer :", solution("987654321") == 20)// 20
print("answer :", solution("10252525252525") == 23)// 23
