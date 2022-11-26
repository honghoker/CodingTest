//  B번 - 붙임성 좋은 총총이
//  https://www.acmicpc.net/contest/problem/895/2
//  Created by 홍은표 on 2022/11/26.

import Foundation

let N = Int(readLine()!)!
var chong = "ChongChong"
var visit: Set<String> = [chong]
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if visit.contains(input[0]) || visit.contains(input[1]) {
        visit.insert(input[0])
        visit.insert(input[1])
    }
}
print(visit.count)
