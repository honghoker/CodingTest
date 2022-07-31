//
//  수식 최대화.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/31.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var answer: Int64 = 0
    var arr = [String]()
    var oper = Set<String>()
    var num = ""
    for ch in expression {
        let ch = String(ch)
        if ["+", "-", "*"].contains(ch) {
            oper.insert(ch)
            arr.append(num)
            num = ""
            arr.append(ch)
        } else {
            num += ch
        }
    }
    arr.append(num)
    
    func calc(_ priority: [String]) {
        var expression = arr
        
        for op in priority {
            while expression.contains(op) {
                let idx = expression.firstIndex(of: op)!
                let operand = expression.remove(at: idx+1)
                switch op {
                    case "+":
                        expression[idx-1] = String(Int(expression[idx-1])! + Int(operand)!)
                    case "-":
                        expression[idx-1] = String(Int(expression[idx-1])! - Int(operand)!)
                    default:
                        expression[idx-1] = String(Int(expression[idx-1])! * Int(operand)!)
                }
                expression.remove(at: idx)
            }
        }
        
        answer = max(answer, abs(Int64(expression.first!)!))
    }
    
    var now = [String]()
    func dfs(_ depth: Int) {
        if depth == oper.count {
            calc(now)
            return
        }
        
        for op in oper {
            if !now.contains(op) {
                now.append(op)
                dfs(depth + 1)
                now.removeLast()
            }
        }
    }
    
    dfs(0)
    
    return answer
}
