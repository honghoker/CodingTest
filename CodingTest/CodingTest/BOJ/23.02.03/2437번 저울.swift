//  백준 - 저울
//  https://www.acmicpc.net/problem/2437
//  Created by 홍은표 on 2023/02/03.

import Foundation

_ = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var sum = 1
for i in 0..<arr.count {
    if sum < arr[i] { break }
    sum += arr[i]
}
print(sum)
