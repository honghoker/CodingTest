//  백준 - 고양이는 많을수록 좋다
//  https://www.acmicpc.net/problem/27961
//  Created by 홍은표 on 2023/04/16.

import Foundation

var N = Int64(readLine()!)!
if N == 0 {
    print(0)
} else {
    var i = 1, idx = 1
    while i < N {
        i <<= 1
        idx += 1
    }
    print(idx)
}
