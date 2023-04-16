//  백준 - 사격 내기
//  https://www.acmicpc.net/problem/27960
//  Created by 홍은표 on 2023/04/16.

import Foundation

var AB = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

for i in 0...9 {
    let targetScore = 1 << i
    let aHit = AB[0] & targetScore
    let bHit = AB[1] & targetScore
    
    if aHit != bHit {
        answer += max(aHit, bHit)
    }
}

print(answer)
