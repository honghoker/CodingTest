//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/12.
//

import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (V, E) = (input[0], input[1])

    var map: [[Int]] = Array(repeating: [], count: V + 1)

    for _ in 0..<E {
        let node = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[node[0]].append(node[1])
        map[node[1]].append(node[0])
    }

    var visit = Array(repeating: false, count : V + 1)
    var color = Array(repeating: false, count : V + 1)

    var answer = true

    for i in 1...V {
        var stack = [i]

        while !stack.isEmpty {
            let node = stack.removeLast()

            for next in map[node] {
                if visit[next] == false {
                    visit[next] = true
                    color[next] = !color[node]
                    stack.append(next)
                } else {
                    if color[next] == color[node] {
                        answer = false
                        break
                    }
                }
            }
        }
    }

    print(answer ? "YES" : "NO")
//
//    func dfs(_ now: Int) {
//        for i in 0..<map[now].count {
//            let next = map[now][i]
//
//            if visit[next] == false {
//                visit[next] = true
//                color[next] = !color[now]
//                dfs(next)
//            } else {
//                if color[next] == color[now] {
//                    answer = false
//                    break
//                }
//            }
//        }
//    }
//
//    for i in 1...V {
//        dfs(i)
//    }
//
//    print(answer ? "YES" : "NO")
}




