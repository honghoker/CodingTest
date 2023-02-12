//  백준 - 소수가 아닌 수
//  https://www.acmicpc.net/problem/27465
//  Created by 홍은표 on 2023/02/12

import Foundation

let N = Int(readLine()!)!
if N < 4 { print(4) }
else if N % 2 != 0 { print(N+1) }
else { print(N) }
