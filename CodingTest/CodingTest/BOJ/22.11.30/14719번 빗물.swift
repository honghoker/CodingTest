//  백준 - 빗물
//  https://www.acmicpc.net/problem/14719
//  Created by 홍은표 on 2022/11/30.

import Foundation

let HW = readLine()!.split(separator: " ").map { Int(String($0))! }
let blocks = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

for i in 1..<blocks.count-1 {
    let leftMax = blocks[...i].max()!
    let rightMax = blocks[(i+1)...].max()!
    let compare = min(leftMax, rightMax)
    if blocks[i] < compare {
        answer += compare - blocks[i]
    }
}

print(answer)
