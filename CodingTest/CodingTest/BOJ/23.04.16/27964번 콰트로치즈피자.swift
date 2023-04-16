//  백준 - 콰트로치즈피자
//  https://www.acmicpc.net/problem/27964
//  Created by 홍은표 on 2023/04/16.

import Foundation

let _ = Int(readLine()!)!
let isQuattro = Set(readLine()!.split(separator: " ").filter { $0.hasSuffix("Cheese") }).count >= 4
print(isQuattro ? "yummy" : "sad")
