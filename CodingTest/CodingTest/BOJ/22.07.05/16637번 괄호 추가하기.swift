//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/04.
//

import Foundation

let N = Int(readLine()!)!
let str = readLine()!.map { String($0) }

var answer = -Int.max

func cal(_ a: Int, _ b: Int, _ oper: String) -> Int {
    if oper == "+" {
        return a + b
    } else if oper == "-" {
        return a - b
    } else {
        return a * b
    }
}

func dfs(_ idx: Int, _ now: Int ) {
    if idx > N - 1 {
        answer = max(answer, now)
        return
    }
    let oper = idx == 0 ? "+" : str[idx-1]
    
    // 괄호로 묶기, 이전 + 괄호 계산
    if idx + 2 < N {
        let bracket = cal(Int(str[idx])!, Int(str[idx+2])!, str[idx+1])
        dfs(idx + 4, cal(now, bracket, oper))
    }
    // 안 묶는다 = 이전 + 다음
    dfs(idx + 2, cal(now, Int(str[idx])!, oper))
}

dfs(0, 0)

print(answer)
