//  백준 - 수 묶기
//  https://www.acmicpc.net/problem/1744
//  Created by 홍은표 on 2022/10/14.

import Foundation

let N = Int(readLine()!)!
var plus = [Int]()
var minus = [Int]()
var answer = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input <= 0 { minus.append(input) }
    else {
        if input == 1 { answer += 1 }
        else { plus.append(input) }
    }
}

plus.sort(by: >)
minus.sort()

if minus.count % 2 == 1 { answer += minus.removeLast() }
if plus.count % 2 == 1 { answer += plus.removeLast() }

while minus.count > 0 || plus.count > 0 {
    if minus.count > 0 { answer += minus.removeLast() * minus.removeLast() }
    if plus.count > 0 { answer += plus.removeLast() * plus.removeLast() }
}

print(answer)
