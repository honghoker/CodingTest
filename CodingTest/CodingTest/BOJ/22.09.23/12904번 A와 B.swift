//  백준 - A와 B
//  https://www.acmicpc.net/problem/12904
//  Created by 홍은표 on 2022/09/23.

import Foundation

let S = Array(readLine()!)
var T = Array(readLine()!)

while true {
    if S.count == T.count {
        if S == T { print(1); break }
        else { print(0); break }
    }
    
    if T.last! == "A" {
        T.removeLast()
    } else {
        T.removeLast()
        T = T.reversed()
    }
}
