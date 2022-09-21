//  백준 - 불!
//  https://www.acmicpc.net/problem/4179
//  Created by 홍은표 on 2022/09/19.

import Foundation

let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (RC[0], RC[1])

var map = [[String]]()

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var jihoon = [(Int, Int)]()
var fire = [(Int, Int)]()
var visit = Array(repeating: Array(repeating: false, count: C), count: R)
var exit = false
for i in 0..<R {
    map.append(readLine()!.map{String($0)})
    for j in 0..<map[i].count {
        if map[i][j] == "J" {
            map[i][j] = "."
            jihoon.append((i, j))
        }
        else if map[i][j] == "F" {
            fire.append((i, j))
        }
    }
}

func moveJihoon() {
    var tempJihoon = [(Int, Int)]()
    
    for i in 0..<jihoon.count {
        for j in 0...3 {
            let nX = jihoon[i].0 + dx[j]
            let nY = jihoon[i].1 + dy[j]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                exit = true
                break
            }
            
            if map[nX][nY] == "." && !visit[nX][nY] {
                tempJihoon.append((nX,nY))
                visit[nX][nY] = true
            }
        }
    }
    jihoon = tempJihoon
}

func burnburn() {
    var tempFire = [(Int, Int)]()
    
    for i in 0..<fire.count {
        for j in 0...3 {
            let nX = fire[i].0 + dx[j]
            let nY = fire[i].1 + dy[j]
            
            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                continue
            }
            
            if map[nX][nY] == "." {
                map[nX][nY] = "F"
                tempFire.append((nX,nY))
            }
        }
    }
    fire = tempFire
}

var count = 0

while true {
    burnburn()
    moveJihoon()
    count += 1
    if exit == true { print(count); break }
    if jihoon.isEmpty { print("IMPOSSIBLE"); break }
}

