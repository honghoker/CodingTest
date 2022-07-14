//
//  숫자 문자열과 영단어.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/14.
//

import Foundation

func solution(_ s:String) -> Int {
//     var map = [String: (Int, Int)]()
//     map["ze"] = (0, 4)
//     map["on"] = (1, 3)
//     map["tw"] = (2, 3)
//     map["th"] = (3, 5)
//     map["fo"] = (4, 4)
//     map["fi"] = (5, 4)
//     map["si"] = (6, 3)
//     map["se"] = (7, 5)
//     map["ei"] = (8, 5)
//     map["ni"] = (9, 4)
    
//     var idx = 0
//     let str = s.map { String($0) }
//     var answer = ""
//     while idx < str.count {
//         if ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(str[idx]) {
//             answer += str[idx]
//             idx += 1
//         } else {
//             let sub = str[idx...idx+1].joined(separator: "")
//             if let s = map[sub]  {
//                 answer += String(s.0)
//                 idx += s.1
//             }
//         }
//     }
    
    var str = s
    let arr = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    for i in 0...9 {
        str = str.replacingOccurrences(of: arr[i], with: String(i))
    }
    
    return Int(str)!
}
