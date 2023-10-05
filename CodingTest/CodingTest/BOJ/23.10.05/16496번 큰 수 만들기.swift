//  백준 - 큰 수 만들기
//  https://www.acmicpc.net/problem/16496
//  Created by 홍은표 on 2023/10/05.

import Foundation

_ = readLine()
let A = readLine()!.split(separator: " ").map { String($0) }.sorted(by: { $0 + $1 > $1 + $0 })
print(A.first == "0" ? "0" : A.joined())
