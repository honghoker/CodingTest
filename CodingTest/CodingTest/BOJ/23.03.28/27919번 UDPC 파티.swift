//  백준 - UDPC 파티
//  https://www.acmicpc.net/problem/27919
//  Created by 홍은표 on 2023/03/28.

import Foundation

let V = readLine()!.map { String($0) }
var map = ["U": 0, "D": 0, "P": 0, "C": 0]
V.forEach { map[$0]! += 1 }

let U = map["U"]!, D = map["D"]!, P = map["P"]!, C = map["C"]!
let minDP = (D + P + 1) / 2

var answer = ""
if U + C > minDP { answer.write("U") }
if D + P > 0 { answer.write("DP") }
print(answer.isEmpty ? "C" : answer)
