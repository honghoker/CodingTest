//  백준 - 곱셈
//  https://www.acmicpc.net/problem/1629
//  Created by 홍은표 on 2022/10/05.

import Foundation

let ABC = readLine()!.split(separator: " ").map { Int(String($0))! }
let (A, B, C) = (ABC[0], ABC[1], ABC[2])

func dfs(_ N: Int) -> Int {
    if N == 0 { return 1 }
    
    var ret = dfs(N/2)
    ret = ret * ret % C
    if N % 2 == 1 { ret = ret * A % C }
    return ret
}

print(dfs(B))
