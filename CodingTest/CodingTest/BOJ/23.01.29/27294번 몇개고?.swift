//  백준 - 몇개고?
//  https://www.acmicpc.net/problem/27294
//  Created by 홍은표 on 2023/01/29.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(!(12...16).contains(input[0]) || input[1] == 1 ? "280" : "320")
