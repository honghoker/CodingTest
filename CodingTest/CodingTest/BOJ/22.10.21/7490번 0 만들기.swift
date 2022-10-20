//  백준 - 0 만들기
//  https://www.acmicpc.net/problem/7490
//  Created by 홍은표 on 2022/10/21.

import Foundation

let T = Int(readLine()!)!

var answer = ""

for _ in 0..<T {
    func dfs(_ now: String, _ depth: Int) {
        if depth == N {
            var current = ""
            var numbers = [Int]()
            var oper = ""
            let str = now.map { String($0) }
            for i in 0..<str.count {
                if str[i] == " " { continue }
                if str[i] == "+" || str[i] == "-" {
                    if oper != "" {
                        if oper == "+" {
                            numbers.append(numbers.removeLast() + Int(current)!)
                        } else {
                            numbers.append(numbers.removeLast() - Int(current)!)
                        }
                        oper = ""
                        current = ""
                    } else {
                        numbers.append(Int(current)!)
                        current = ""
                    }
                    oper = str[i]
                } else {
                    current += str[i]
                }
            }
            let sum = numbers.isEmpty ? 0 : numbers.removeLast()
            if oper == "-" {
                if sum - Int(current)! == 0 { result.append(now) }
            } else {
                if sum + Int(current)! == 0 { result.append(now) }
            }
            return
        }
        dfs(now + "+\(depth+1)", depth + 1)
        dfs(now + "-\(depth+1)", depth + 1)
        dfs(now + " \(depth+1)", depth + 1)
    }
    
    var result = [String]()
    let N = Int(readLine()!)!
    dfs("1", 1)
    answer += result.sorted().joined(separator: "\n")
    answer += "\n\n"
}

print(answer)
