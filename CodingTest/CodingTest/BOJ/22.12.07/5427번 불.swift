//  백준 - 불
//  https://www.acmicpc.net/problem/5427
//  Created by 홍은표 on 2022/12/07.

import Foundation

let T = Int(readLine()!)!
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var answer = ""

for _ in 0..<T {
    let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
    var map = [[String]]()
    var sang = [(Int, Int)]()
    var burn = [(Int, Int)]()

    for i in 0..<wh[1] {
        map.append(readLine()!.map { String($0) })
        for j in 0..<wh[0] {
            if map[i][j] == "@" {
                sang.append((i, j))
                map[i][j] = "."
            }
            if map[i][j] == "*" {
                burn.append((i, j))
            }
        }
    }

    func burnburn() {
        var front = 0
        var nextBurn = [(Int, Int)]()
        while front < burn.count {
            let (x, y) = burn[front]
            front += 1
            
            for i in 0...3 {
                let nX = x + dx[i]
                let nY = y + dy[i]
                if nX < 0 || nY < 0 || nX >= wh[1] || nY >= wh[0] {
                    continue
                }
                if map[nX][nY] == "." || map[nX][nY] == "v" {
                    map[nX][nY] = "*"
                    nextBurn.append((nX, nY))
                }
            }
        }
        
        burn = nextBurn
    }

    func movemove() -> Bool {
        var front = 0
        var nextSang = [(Int, Int)]()
        while front < sang.count {
            let (x, y) = sang[front]
            front += 1
            
            if x == 0 || y == 0 || x == wh[1] - 1 || y == wh[0] - 1 {
                return true
            }
            for i in 0...3 {
                let nX = x + dx[i]
                let nY = y + dy[i]
                if nX < 0 || nY < 0 || nX >= wh[1] || nY >= wh[0] {
                    continue
                }
                if map[nX][nY] == "." {
                    map[nX][nY] = "v"
                    nextSang.append((nX, nY))
                }
            }
        }
        
        sang = nextSang
        return false
    }

    var count = 0
    var result = "IMPOSSIBLE\n"
    while true {
        burnburn()
        if true == movemove() {
            result = "\(count+1)\n"
            break
        }
        if sang.isEmpty { break }
        count += 1
    }

    answer += result
}

print(answer)
