//  백준 - 탁구 경기
//  https://www.acmicpc.net/problem/27918
//  Created by 홍은표 on 2023/03/28.

import Foundation

var (d, p) = (0, 0)
for _ in 0..<Int(readLine()!)! {
    if readLine()! == "D" { d += 1 }
    else { p += 1 }
    if abs(d - p) == 2 { break }
}
print("\(d):\(p)")
