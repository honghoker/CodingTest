//  프로그래머스 - 무인도 여행
//  https://school.programmers.co.kr/learn/courses/30/lessons/154540
//  Created by 홍은표 on 2023/01/26.

import Foundation

func solution(_ maps:[String]) -> [Int] {
    var maps = maps.map { $0.map { String($0) } }
    var answer = [Int]()
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if maps[i][j] != "X" {
                var queue = [(i, j)]
                var front = 0, sum = Int(maps[i][j])!
                maps[i][j] = "X"
                
                while front < queue.count {
                    let (x, y) = queue[front]
                    front += 1

                    for i in 0...3 {
                        let nX = x + dx[i]
                        let nY = y + dy[i]
                        if nX < 0 || nY < 0 || nX >= maps.count || nY >= maps[0].count || maps[nX][nY] == "X" {
                            continue
                        }
                        queue.append((nX, nY))
                        sum += Int(maps[nX][nY])!
                        maps[nX][nY] = "X"
                    }
                }
                answer.append(sum)
            }
        }
    }
    return answer.isEmpty ? [-1] : answer.sorted()
}
