//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/03.
//

import Foundation

let NMK = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M, K) = (NMK[0], NMK[1], NMK[2])

var map: [[Int]] = Array(repeating: [], count: N+1)
map[0] = Array(repeating: 0, count: M+1)
for i in 1...N {
    map[i] = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
}
var rcs = [(r: Int, c: Int, s: Int)]()
for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    rcs.append((r : input[0], c: input[1], s: input[2]))
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func rotate(_ r: Int, _ c: Int, _ s: Int, _ map: [[Int]]) -> [[Int]] {
    var map = map
    var idx = 0
    while true {
        let (sX, sY) = (r-s+idx, c-s+idx)
        let (eX, eY) = (r+s-idx, c+s-idx)
        let value = map[sX][sY+1]
        
        if sX == eX && sY == eY {
            break
        }
        var d = 0
        
        var queue = [(sX, sY+1, value)]
        map[sX][sY+1] = map[sX][sY]
        var front = 0
        
        while front < queue.count {
            let (x, y, value) = queue[front]
            front += 1
            if x == sX && y == sY {
                break
            }
            for i in 0...3 {
                let nX = x + dx[(d + i) % 4]
                let nY = y + dy[(d + i) % 4]
                
                if nX < sX || nX > eX || nY < sY || nY > eY {
                    continue
                }
                
                d = (d + i) % 4
                
                queue.append((nX, nY, map[nX][nY]))
                map[nX][nY] = value
                break
            }
        }
        
        idx += 1
    }
    return map
}

var visit = Array(repeating: false, count: K+1)

var answer = Int.max

func dfs(_ map: [[Int]], _ depth: Int) {
    if depth == K {
        for i in 1...N {
            answer = min(answer, map[i].reduce(0, +))
        }
        return
    }
    
    for i in 0..<K {
        if !visit[i] {
            visit[i] = true
            let result =  rotate(rcs[i].r, rcs[i].c, rcs[i].s, map)
            dfs(result, depth + 1)
            visit[i] = false
        }
    }
}

dfs(map, 0)

print(answer)
