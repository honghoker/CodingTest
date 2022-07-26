//
//  호텔 방 배정.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/27.
//

import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var room: [Int64: Int64] = [:]
    
    func findRoomNumber(_ index: Int64) -> Int64 {
        guard let nextRoomNumber = room[index] else {
            // 방이 비어있을 경우
            room[index] = index + 1
            
            return index
        }
        // 방이 차있을 경우
        let nextBlankNumber = findRoomNumber(nextRoomNumber)
        room[index] = nextBlankNumber + 1 // 다음 비어있는 방 표시
        
        return nextBlankNumber
    }
    
    let answer: [Int64] = room_number.map { findRoomNumber($0) }
    
    return answer
}
