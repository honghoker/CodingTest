//  백준 - 눈 치우기
//  https://www.acmicpc.net/problem/26215
//  Created by 홍은표 on 2022/12/11.

import Foundation

let N = Int(readLine()!)!
var houses = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var time = 0
while !houses.isEmpty {
    if houses.count == 1 {
        if houses.last! + time > 1440 { time = -1 }
        else { time += houses.removeLast() }
        break
    } else {
        let h1 = houses.removeLast() - 1
        let h2 = houses.removeLast() - 1
        if h1 > 0 { houses.append(h1) }
        if h2 > 0 { houses.append(h2) }
        time += 1
        houses.sort()
    }
}
print(time)
