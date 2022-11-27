//  백준 - 현대모비스 소프트웨어 아카데미
//  https://www.acmicpc.net/problem/26091
//  Created by 홍은표 on 2022/11/28.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let peeps = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var answer = 0, left = 0, right = peeps.count - 1
while left < right {
    if peeps[left] + peeps[right] >= NM[1] { answer += 1; left += 1; right -= 1 }
    else { left += 1 }
}
print(answer)
