//  백준 - 공통 순열
//  https://www.acmicpc.net/problem/1622
//  Created by 홍은표 on 2022/12/26.

import Foundation

var answer = ""
while let a = readLine() {
    let b = readLine()!
    var x = ""
    var map = [Character: Int]()
    a.forEach { map[$0, default: 0] += 1 }
    b.forEach { if map[$0, default: 0] > 0 { map[$0]! -= 1; x.write("\($0)") } }
    answer.write("\(String(x.sorted()))\n")
}
print(answer)
