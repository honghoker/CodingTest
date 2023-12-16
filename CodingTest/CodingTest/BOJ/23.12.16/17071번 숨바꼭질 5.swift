//  백준 - 숨바꼭질 5
//  https://www.acmicpc.net/problem/17071
//  Created by 홍은표 on 23/12/16.

import Foundation

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
var (N, K) = (NK[0], NK[1])

func bfs() -> Int {
    var V = [[Bool]](repeating: [Bool](repeating: false, count: 500001), count: 2)
    var q = [N], f = 0, m = 1
    while f < q.count {
        K += m
        
        if K > 500000 { return -1 }
        if V[m % 2][K] { return m }
        
        let size = q.count - f
        for _ in 0..<size {
            let x = q[f]; f += 1
            
            for nX in [x + 1, x - 1, x * 2] {
                if nX == K { return m }
                if nX < 0 || nX > 500000 || V[m % 2][nX] { continue }
                V[m % 2][nX] = true
                q.append(nX)
            }
        }
        m += 1
    }
    return -1
}

if N == K { print(0) }
else { print(bfs()) }
