//  백준 - 시로코와 은행털기
//  https://www.acmicpc.net/problem/26607
//  Created by 홍은표 on 2023/01/08.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k, x) = (input[0], input[1], input[2])
var arr = [(Int, Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var brr = [Set<Int>]()
for _ in 0...k {
    brr.append(Set<Int>())
}

for i in 0..<n {
    for j in stride(from: k-1, through: 1, by: -1) {
        for t in brr[j] {
            brr[j+1].insert(t+arr[i].0)
        }
    }
    brr[1].insert(arr[i].0)
}

var answer = 0
for t in brr[k] {
    answer = max(answer, t*(k*x-t))
}
print(answer)
