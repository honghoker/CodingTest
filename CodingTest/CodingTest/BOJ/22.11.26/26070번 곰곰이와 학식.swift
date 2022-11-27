//  백준 - 곰곰이와 학식
//  https://www.acmicpc.net/problem/26070
//  Created by 홍은표 on 2022/11/26.

import Foundation

var gom = readLine()!.split(separator: " ").map { Int(String($0))! }
var chong = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = 0, idx = 0, prev = -1
while true {
    if gom[idx] >= chong[idx] {
        // 식권을 다 썼다
        answer += chong[idx]
        gom[idx] -= chong[idx]
        chong[idx] = 0
    } else {
        // 식권이 남는다
        answer += gom[idx]
        chong[idx] -= gom[idx]
        gom[idx] = 0
        // 다음 식권으로 교환
        chong[(idx+1) % 3] += chong[idx] / 3
        chong[idx] %= 3
    }
    
    idx += 1
    if idx % 3 == 0 {
        if prev == answer { break }
        prev = answer
        idx = 0
    }
}

print(answer)
/*
10 0 0
0 0 30
*/
