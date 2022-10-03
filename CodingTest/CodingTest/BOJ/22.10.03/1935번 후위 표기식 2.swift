//  백준 - 후위 표기식 2
//  https://www.acmicpc.net/problem/1935
//  Created by 홍은표 on 2022/10/03.

import Foundation

let N = Int(readLine()!)!
let s = readLine()!
var map = [Character: Double]()
var stack = [Double]()

for i in 0..<N {
    map[Character(UnicodeScalar(65 + i)!)] = Double(readLine()!)!
}

func calc(_ op: Character, _ num1: Double, _ num2: Double) -> Double {
    switch op {
    case "+": return num1 + num2
    case "-": return num1 - num2
    case "*": return num1 * num2
    case "/": return num1 / num2
    default: return 0
    }
}

for ch in s {
    if ch.isLetter {
        stack.append(map[ch]!)
        continue
    }
    
    let num = stack.removeLast()
    stack.append(calc(ch, stack.removeLast(), num))
}

print(String(format: "%.2f", stack[0]))
