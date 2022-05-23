//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/23.
//

import Foundation

let n = Int(readLine()!)!
let connect = Int(readLine()!)!

var computer = [Int:[Int]]()
for i in 1...n {
    computer[i] = []
}

for _ in 0..<connect {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    computer[input[0]]!.append(input[1])
    computer[input[1]]!.append(input[0])
}

var v = [Int]()
var stack: [Int] = [1]

while stack.isEmpty == false {
    guard let temp = stack.popLast() else { fatalError() }
    if !v.contains(temp) {
        v.append(temp)
        
        guard let temp2 = computer[temp] else { fatalError() }
        stack += temp2
    }
}

print(v.count - 1)




//count = computer[1]!.count

//solution(1)
//
//func solution(_ index: Int) {
//    print("index : \(index), v[index] = \(v[index])")
//    if v[index] == false {
//        v[index] = true
//        if computer[index]!.isEmpty == false {
//            for i in 0..<computer[1]!.count {
//                let index = computer[1]![i]
//                solution(index)
//            }
//        }
//        count += 1
//    }
//    return
//}
//
//print(count-1)
