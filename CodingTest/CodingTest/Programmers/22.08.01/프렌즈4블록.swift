//
//  프렌즈4블록.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/01.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    var board = board.map { $0.map { String($0) } }
    
    let d = [
        [[-1, 0], [-1, -1], [0, -1]], // 왼쪽 위
        [[1, 0], [1, -1], [0, -1]], // 왼쪽 아래
        [[-1, 0], [-1, 1], [0, 1]], // 오른쪽 위
        [[1, 0], [1, 1], [0, 1]] // 오른쪽 아래
    ]
    
    func find() -> [[Int]] {
        var remove = Set<String>()
    
        for i in 0..<m {
            for j in 0..<n {
                let now = board[i][j]
                var tempRemove = Set<String>()
                for k in 0...3 {
                    tempRemove = ["\(i),\(j)"]
                    for l in 0...2 {
                        let nX = i + d[k][l][0]
                        let nY = j + d[k][l][1]

                        if nX < 0 || nX >= m || nY < 0 || nY >= n || board[nX][nY] == "" {
                            break
                        }

                        if board[nX][nY] != now {
                            break
                        }

                        tempRemove.insert("\(nX),\(nY)")
                    }


                    if tempRemove.count == 4 {
                        remove = remove.union(tempRemove)
                    }
                }
            }
        }

        let removeArr = remove.map { $0.split(separator: ",").map { Int(String($0))! } }

        return removeArr
    }
    
    func gravity() {
        for i in 0..<n {
            for j in stride(from: m-1, through: 0, by: -1) {
                if board[j][i] == "" {
                    var blank = j
                    var idx = j - 1
                    while idx >= 0 {
                        if board[idx][i] != "" {
                            board[blank][i] = board[idx][i]
                            board[idx][i] = ""
                            break
                        }
                        idx -= 1
                    }
                }
            }
        }
    }
    
    
    while true {
        var removeArr = find()
        if removeArr.isEmpty { break }
        for r in removeArr {
            board[r[0]][r[1]] = ""
            answer += 1
        }
        gravity()
    }
    
    return answer
}
