//  백준 - 빅데이터? 정보보호!
//  https://www.acmicpc.net/problem/26264
//  Created by 홍은표 on 2022/12/18.

import Foundation

let N = Int(readLine()!)!
let str = readLine()!.map { String($0) }
var idx = 0, bigDataCount = 0, securityCount = 0

while idx < str.count {
    if str[idx] == "b" { bigDataCount += 1; idx += 7 }
    else { securityCount += 1; idx += 8 }
}

if bigDataCount > securityCount { print("bigdata?") }
else if bigDataCount < securityCount { print("security!") }
else { print("bigdata? security!") }
