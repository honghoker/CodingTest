//
//  1259번 팰린드롬수
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

var input = readLine()!

while input != "0" {
    let arr = input.map { String($0) }
    
    var result = true
    var l = 0
    var r = arr.count - 1
    
    while l < r {
        if arr[l] == arr[r] {
            l = l + 1
            r = r - 1
        } else {
            result = false
            break
        }
    }
    
    print(result ? "yes" : "no")
    
    input = readLine()!
}

