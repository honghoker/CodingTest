//
//  1157번 단어공부.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

let input = readLine()!.uppercased()

var result = [String]()
var strMap = [String:Int]()

let arr = input.map( { String($0) })

for i in 0..<arr.count {
    strMap[arr[i]] = strMap[arr[i]] != nil ? strMap[arr[i]]! + 1 : 0
}

for key in strMap.keys {
    if strMap[key] == strMap.values.max() {
        result.append(key)
    }
}

print(result.count == 1 ? result[0] : "?")

