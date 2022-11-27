//  백준 - WARBOY
//  https://www.acmicpc.net/problem/26082
//  Created by 홍은표 on 2022/11/27.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[2] * 3 * (input[1] / input[0]))
