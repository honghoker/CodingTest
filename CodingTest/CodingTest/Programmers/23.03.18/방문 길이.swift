//  프로그래머스 - 방문 길이
//  https://school.programmers.co.kr/learn/courses/30/lessons/49994
//  Created by 홍은표 on 2023/03/18.

import Foundation

func solution(_ dirs:String) -> Int {
    var map = Set<String>()
    let direction = [
        "U": (-1, 0),
        "L": (0, -1),
        "R": (0, 1),
        "D": (1, 0)
    ]
    
    var (x, y) = (0, 0)
    for dir in dirs {
        let (dx, dy) = direction[String(dir)]!
        let (nX, nY) = (x + dx, y + dy)
        if nX < -5 || nY < -5 || nX > 5 || nY > 5 { continue }
        if !map.contains("\(x)\(y)\(nX)\(nY)") {
            map.insert("\(x)\(y)\(nX)\(nY)")
            map.insert("\(nX)\(nY)\(x)\(y)")
        }
        (x, y) = (nX, nY)
    }
    
    return map.count / 2
}
