//
//  11724번 연결요소의 개수
//  CodingTest
//
//  Created by 홍은표 on 2022/06/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])

var arr: [[Int]] = Array(repeating: [], count: N + 1)
var visit = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let node = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[node[0]].append(node[1])
    arr[node[1]].append(node[0])
}

var answer = 0

func dfs(_ now: Int) {
    visit[now] = true
    for i in 0..<arr[now].count {
        let next = arr[now][i]
        if visit[next] == false {
            dfs(next)
        }
    }
}

for i in 1...N {
    if visit[i] == false {
        answer += 1
        dfs(i)
    }
}

print(answer)

//for i in 1...N {
//    if visit[i] == false {
//        visit[i] = true
//        var stack = [i]
//        answer += 1
//
//        while !stack.isEmpty {
//            let node = stack.removeLast()
//            let temp = arr[node]
//            for j in 0..<temp.count {
//                let next = temp[j]
//                if visit[next] == false {
//                    visit[next] = true
//                    stack.append(next)
//                }
//            }
//        }
//    }
//}


