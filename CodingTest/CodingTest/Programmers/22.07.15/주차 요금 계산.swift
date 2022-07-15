//
//  주차 요금 계산.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/15.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var car = [String: [String]]()
    var result = [String: Int]()
    for r in records {
        let rec = r.split(separator: " ").map { String($0) }
        let (time, num, inOut) = (rec[0], rec[1], rec[2])
        if inOut == "IN" {
            if car[num] == nil { car[num] = [] }
            car[num]!.append(time)
        } else {
            let inTime = car[num]!.removeLast()
            let inTimeSp = inTime.split(separator: ":").map { Int(String($0))! }
            let outTimeSp = time.split(separator: ":").map { Int(String($0))! }
            
            let sum = ((outTimeSp[0] - inTimeSp[0]) * 60) + outTimeSp[1] - inTimeSp[1]
            if result[num] == nil { result[num] = sum }
            else { result[num]! += sum }
        }
    }
    let notExit = car.filter { $0.value.isEmpty == false }
    
    for n in notExit {
        let inTime = n.value.last!
        let inTimeSp = inTime.split(separator: ":").map { Int(String($0))! }
        let outTimeSp = [23, 59]

        let sum = ((outTimeSp[0] - inTimeSp[0]) * 60) + outTimeSp[1] - inTimeSp[1]
        if result[n.key] == nil { result[n.key] = sum }
        else { result[n.key]! += sum }
    }
    
    var answer = [Int]()
    for m in result.sorted { $0.key < $1.key } {
        if m.value <= fees[0] {
            answer.append(fees[1])
        } else {
            let ceilVal = Int(ceil(Double(m.value - fees[0]) / Double(fees[2])))
            answer.append(fees[1] + ceilVal * fees[3])
        }
    }
    
    return answer
}
