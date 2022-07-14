//
//  거리두기 확인하기.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/14.
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var answer = [Int]()
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    func check(_ place: [String]) -> Int {
        var map = [[String]]()
        var person: [(Int, Int)] = []
        var visit = Array(repeating: Array(repeating: false, count: 5), count: 5)
        for i in 0..<5 {
            map.append(place[i].map { String($0) })
            for j in 0..<5 {
                if map[i][j] == "P" {
                    person.append((i, j))
                }
            }
        }

        for i in 0..<person.count {
            let (x, y) = person[i]
            visit[x][y] = true
            
            var queue = [(x, y)]
            var front = 0
            while front < queue.count {
                let (qX, qY) = queue[front]
                front += 1
                
                for i in 0...3 {
                    let nX = qX + dx[i]
                    let nY = qY + dy[i]

                    if nX < 0 || nY < 0 || nX >= 5 || nY >= 5 || map[nX][nY] == "X" || visit[nX][nY] {
                        continue
                    }

                    if abs(x - nX) + abs(y - nY) <= 2 && map[nX][nY] == "P" {
                        return 0
                    }

                    if map[nX][nY] == "O" && abs(x - nX) + abs(y - nY) <= 2 {
                        visit[nX][nY] = true
                        queue.append((nX, nY))
                    }
                }
            }
        }
        return 1
    }
    
    for i in 0..<5 {
        answer.append(check(places[i]))
    }
    
    return answer
}
