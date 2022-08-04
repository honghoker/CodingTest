//
//  압축.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/04.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var map = [String: Int]()
    let msg = msg.map{String($0)}
    var alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    for (i, ch) in alphabets.enumerated() {
        map[String(ch)] = i + 1
    }
    
    var idx = 0
    var str = ""
    var answer = [Int]()
    while idx < msg.count {
        let ch = msg[idx] // 다음 글자
        var tmpString = str + ch // 현재 입력
        print(ch, tmpString)
        
        guard let _ = map[tmpString] else {
            map[tmpString] = map.count + 1
            answer.append(map[str]!)
            
            str = ""
            continue
        }
        
        str += ch
        idx += 1
    }
    answer.append(map[str]!)
    return answer
}
