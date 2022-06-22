//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/17.
//

import Foundation

let Input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (L, C) = (Input[0], Input[1])

var map = readLine()!.split(separator: " ").map { String($0) }.sorted()

var answer = [String]()
let check = ["a", "e", "i", "o", "u"]
var visit = Array(repeating: false, count: C)

func dfs(_ now: String, _ idx: Int, _ depth: Int) {
    if depth == L {
        let temp = now.map { String($0) }
        var moCount = 0
        var jaCount = 0
        for t in temp {
            if check.contains(t) {
                moCount += 1
            } else {
                jaCount += 1
            }
        }
        
        if moCount >= 1 && jaCount >= 2 {
            answer.append(now)
        }
        return
    }
    
    for i in idx + 1..<C {
        if visit[i] == false {
            visit[i] = true
            dfs(now + map[i], i, depth + 1)
            visit[i] = false
        }
    }
}

for i in 0..<C {
    dfs(map[i], i, 1)
}

for ans in answer {
    print(ans)
}
