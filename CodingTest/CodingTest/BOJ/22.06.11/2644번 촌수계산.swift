//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/11.
//

import Foundation

let n = Int(readLine()!)!

let person = readLine()!.split(separator: " ").map { Int(String($0))! }

let m = Int(readLine()!)!

var arr = [Int: [Int]]()
var visit = [Int]()

for i in 0...n {
    arr[i] = []
}

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[xy[0]]!.append(xy[1])
    arr[xy[1]]!.append(xy[0])
}

var queue = [(person[0], 0)]

var answer = -1

while !queue.isEmpty {
    let node = queue.removeFirst()
    if node.0 == person[1] {
        answer = node.1
        break
    }
    if !visit.contains(node.0) {
        visit.append(node.0)
        guard let temp = arr[node.0] else { fatalError() }
        for t in temp {
            if t > node.0 {
                queue.append((t, node.1 + 1))
            } else {
                queue.append((t, node.1 + 1))
            }
        }
    }
}

print(answer)
