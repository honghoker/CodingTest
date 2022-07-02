//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//

import Foundation

let N = 7
var map = [[Int]]()
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var ball = Int(readLine()!)!

// 가로, 세로 그룹 체크

var answer = Int.max
var standard = 0

func drop(_ row: Int, _ map: [[Int]]) {
    var myMap = map
    var standard = 0
    for i in 0..<N {
        if map[i][row] != 0 { break }
        standard = i
    }
    
    myMap[standard][row] = ball
    
    for map in myMap {
        print(map)
    }
    print("------")
    var removePosition = [(Int, Int)]()
    
    // 가로 체크
//    while true {
        removePosition = []
//        let horizontalCount = myMap[standard].filter { $0 > 0 }.count
        for i in 0..<N {
            let horizontalCount = myMap[standard-i].filter { $0 > 0 }.count
            if horizontalCount == 1 && horizontalCount == 7 {
                if myMap[standard-i][i] == horizontalCount {
                    removePosition.append((standard-i, i))
                }
            } else if horizontalCount != 0 {
                // 그룹 찾기
                var queue = [(standard-i, 0)]
                var front = 0
                var member = [(Int, Int)]()
                while !queue.isEmpty {
                    let node = queue[front]
                    
                    let x = node.0
                    let y = node.1
                    
                    for i in 0..<N-y {
                        let nY = y + i
                        if myMap[x][nY] != 0 {
                            member.append((x, nY))
                        }
                    }
                }
                
            }
        }
        
        print(removePosition)
        
        // 세로 체크
        var verticalCount = 0
        for i in 0..<N {
            if myMap[i][row] != 0 {
                verticalCount += 1
            }
        }
        for i in 0..<N {
            if myMap[i][row] == verticalCount {
                removePosition.append((i, row))
            }
        }
        
//        if removePosition.isEmpty { break }
        
        // 공 지우기
        for i in 0..<removePosition.count {
            let x = removePosition[i].0
            let y = removePosition[i].1
            myMap[x][y] = 0
            var s = x
            while s > 0 {
                myMap[s][y] = myMap[s-1][y]
                s -= 1
            }
        }
//        print(horizontalCount)
//        print(verticalCount)
        for map in myMap {
            print(map)
        }
        print(" ")
//    }

    
}

drop(2, map)
//for i in 0..<7 {
//    drop(i, map)
//    print("------")
//}

//print(answer)
