//  백준 - Acronyms
//  https://www.acmicpc.net/problem/10190
//  Created by 홍은표 on 2022/12/18.

import Foundation

var answer = ""
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    answer.write("\(input[0])\n")
    for _ in 0..<Int(input[1])! {
        let str = readLine()!
        if input[0] == str.split(separator: " ").map({ String($0.first!) }).joined() { answer.write("\(str)\n") }
    }
}
print(answer)
