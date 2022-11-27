//  백준 - 치킨댄스를 추는 곰곰이를 본 임스 2
//  https://www.acmicpc.net/problem/26068
//  Created by 홍은표 on 2022/11/26.

import Foundation

let N = Int(readLine()!)!
var answer = 0
for _ in 0..<N {
    let input = readLine()!.split(separator: "-").map { String($0) }
    if Int(input[1])! <= 90 { answer += 1 }
}
print(answer)
