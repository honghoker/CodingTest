//  백준 - 치킨 배달
//  https://www.acmicpc.net/problem/15686
//  Created by 홍은표 on 2022/10/18.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (NM[0], NM[1])

var answer = Int.max
var map = [[Int]]()
var houses = [(Int, Int)]()
var chickens = [(Int, Int)]()

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    for j in 0..<N {
        if map[i][j] == 1 {
            houses.append((i, j))
        } else if map[i][j] == 2 {
            chickens.append((i, j))
        }
    }
}

func getChickenDist() -> Int {
    var sum = 0
    for house in houses {
        var d = Int.max
        
        for idx in stack {
            let chicken = chickens[idx]
            let dist = abs(chicken.0 - house.0) + abs(chicken.1 - house.1)
            d = min(d, dist)
        }
        sum += d
    }
    return sum
}

var stack = [Int]()

func dfs() {
    if stack.count == M {
        answer = min(answer, getChickenDist())
        return
    }
    let idx = stack.isEmpty ? 0 : stack.last! + 1
    for i in idx..<chickens.count {
        stack.append(i)
        dfs()
        stack.removeLast()
    }
}

dfs()

print(answer)
