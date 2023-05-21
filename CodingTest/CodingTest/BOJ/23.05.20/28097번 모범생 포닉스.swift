//  백준 - 모범생 포닉스
//  https://www.acmicpc.net/problem/28097
//  Created by 홍은표 on 2023/05/20.

let N = Int(readLine()!)!
let T = readLine()!.split(separator: " ").map { Int(String($0))! }
let answer = ((N - 1) * 8) + T.reduce(0, +)
print(answer / 24, answer % 24)
