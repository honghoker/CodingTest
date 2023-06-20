//  백준 - 체스판 다시 칠하기
//  https://www.acmicpc.net/problem/1018
//  Created by 홍은표 on 2023/06/21    .

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let map = (0..<NM[0]).map { _ in readLine()!.map { String($0) } }
var answer = Int.max

for i in 0..<NM[0] - 7 {
    for j in 0..<NM[1] - 7 {
        var c1 = 0, c2 = 0
        for k in i..<i + 8 {
            for l in j..<j + 8 {
                if (k + l) % 2 == 0 {
                    if map[k][l] != "B" { c1 += 1 }
                    if map[k][l] != "W" { c2 += 1 }
                } else {
                    if map[k][l] != "W" { c1 += 1 }
                    if map[k][l] != "B" { c2 += 1 }
                }
            }
        }
        answer = min(answer, c1, c2)
    }
}
print(answer)
