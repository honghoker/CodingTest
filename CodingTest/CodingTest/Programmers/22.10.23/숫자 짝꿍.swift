//
//  숫자 짝꿍.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/10/23.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var answer = ""
    var xMap = [Character: Int]()
    var yMap = [Character: Int]()
    
    for ch in X { xMap[ch, default: 0] += 1 }
    for ch in Y { yMap[ch, default: 0] += 1 }
    
    var isZero = true
    
    for key in yMap.keys.sorted(by: >) {
        guard let xValue = xMap[key], xValue != 0 else { continue }
        guard let yValue = yMap[key], yValue != 0 else { continue }
        if isZero && key != "0" { isZero = false }
        answer += String(repeating: key, count: min(xValue, yValue))
    }
    
    return answer == "" ? "-1" : isZero ? "0" : answer
}
