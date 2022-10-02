//  백준 - 알파벳
//  https://www.acmicpc.net/problem/1987
//  Created by 홍은표 on 2022/10/02.

import Foundation

let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (RC[0], RC[1])

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var map = [[Int]]()

for _ in 0..<R {
    map.append(readLine()!.map { Int($0.asciiValue!) - 65 } )
}

print(map)

var answer = 0

func dfs(_ x: Int, _ y: Int, _ cost: Int, _ bit: Int) {
    answer = max(answer, cost)
    for i in 0...3 {
        let nX = x + dx[i]
        let nY = y + dy[i]
        
        if nX < 0 || nY < 0 || nX >= R || nY >= C {
            continue
        }
        let next = 1 << map[nX][nY]
        if bit & next == 0 {
            dfs(nX, nY, cost + 1, bit | next)
        }
    }
}

dfs(0, 0, 1, 1 << map[0][0])

print(answer)
