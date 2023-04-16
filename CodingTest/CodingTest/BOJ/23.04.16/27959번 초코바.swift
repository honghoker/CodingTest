//  백준 - 초코바
//  https://www.acmicpc.net/problem/27959
//  Created by 홍은표 on 2023/04/16.

import Foundation

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
print(NM[0] * 100 >= NM[1] ? "Yes" : "No")
