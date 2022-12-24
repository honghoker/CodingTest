//  백준 - 성장의 비약 선택권
//  https://www.acmicpc.net/problem/26645
//  Created by 홍은표 on 2022/12/23.

import Foundation

let N = Int(readLine()!)!
var answer = 4
if (N + 8) < 214 { answer = 1 }
else if (N + 4) < 222 { answer = 2 }
else if (N + 2) < 231 { answer = 3 }
print(answer)
