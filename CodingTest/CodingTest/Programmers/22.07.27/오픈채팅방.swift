//
//  오픈채팅방.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/27.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var nickName = [String: String]()
    var result = [(String, String)]()
    
    for i in 0..<record.count {
        let sun = record[i].split(separator: " ").map{String($0)}
        
        let (state, uid) = (sun[0], sun[1])
        if state == "Enter" {
            nickName[uid] = sun[2]
            result.append((uid, "님이 들어왔습니다."))
        } else if state == "Leave" {
            result.append((uid, "님이 나갔습니다."))
        } else {
            nickName[uid] = sun[2]
        }
    }

    return result.map { "\(nickName[$0.0]!)\($0.1)" }
}
