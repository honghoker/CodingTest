//  프로그래머스 - 공원 산책
//  https://school.programmers.co.kr/learn/courses/30/lessons/172928
//  Created by 홍은표 on 2023/03/23.

import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { $0.map { String($0) }}
    let col = park.count, row = park[0].count
    let direction = [
        "N": (-1, 0),
        "S": (1, 0),
        "W": (0, -1),
        "E": (0, 1)
    ]
    var (x, y) = (0, 0)
    for i in 0..<col {
        for j in 0..<row where park[i][j] == "S" {
            (x, y) = (i, j); break
        }
    }
    
    func move(_ robot: (Int, Int), _ op: String, _ n: Int) -> (Int, Int)? {
        var (x, y) = robot, idx = 0
        while idx < n {
            let d = direction[op]!
            let (nX, nY) = (x + d.0, y + d.1)
            if nX < 0 || nY < 0 || nX >= col || nY >= row || park[nX][nY] == "X" { return nil }
            (x, y) = (nX, nY)
            idx += 1
        }
        return (x, y)
    }
    
    routes.forEach {
        let route = $0.split(separator: " ").map { $0 }
        let (op, n) = (String(route[0]), Int(route[1])!)
        if let result = move((x, y), op, n) { (x, y) = result }
    }
    
    return [x, y]
}
