//  백준 - 흙길 보수하기
//  https://www.acmicpc.net/problem/1911
//  Created by 홍은표 on 2022/09/23.

import Foundation

let NL = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, L) = (NL[0], NL[1])

var water = [(Int, Int)]()

for _ in 0..<N {
    let w = readLine()!.split(separator: " ").map { Int(String($0))! }
    water.append((w[0], w[1]))
}

water.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

var idx = 0
var answer = 0

for (start, end) in water {
    if idx >= end { continue }
    
    idx = max(start, idx)
    
    let need = ((end - idx) / L) + ((end - idx) % L == 0 ? 0 : 1)

    idx += need * L
    answer += need
}

print(answer)
