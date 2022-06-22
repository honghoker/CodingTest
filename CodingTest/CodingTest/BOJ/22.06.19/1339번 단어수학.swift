//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/19.
//

import Foundation

let N = Int(readLine()!)!

var map = [[String]]()
var dict = [String: Int]()

for i in 0..<N {
    map.append(readLine()!.map { String($0) })
    
    var val = Int(pow(10, Double(map[i].count - 1)))
    for j in 0..<map[i].count {
        if dict[map[i][j]] == nil {
            dict[map[i][j]] = val
        } else {
            dict[map[i][j]]! += val
        }
        
        val = val / 10
    }
}

var answer = 0
var cnt = 9
for num in dict.values.sorted(by: >) {
    answer += cnt * num
    cnt -= 1
}

print(answer)
