//  백준 - Total Count
//  https://www.acmicpc.net/problem/5366
//  Created by 홍은표 on 2022/12/18.

import Foundation

var map = [String: Int]()
var strs = [String]()
var answer = ""
var total = 0
while true {
    guard let str = readLine(), str != "0" else { break }
    if !strs.contains(str) { strs.append(str) }
    map[str, default: 0] += 1; total += 1
}

for key in strs { answer.write("\(key): \(map[key]!)\n") }
answer.write("Grand Total: \(total)\n")
print(answer)
