//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (N, M, V) = (input[0], input[1], input[2])

var arr = [Int:[Int]]()

for i in 1...N {
    arr[i] = []
}

for _ in 1...M {
    let inp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let src = inp[0]
    let dsc = inp[1]
    arr[src]!.append(dsc)
    arr[dsc]!.append(src)
}

var visit = [Int]()
var stack = [V]

var dfsAnswer = ""

for key in arr.keys {
    arr[key]!.sort(by: >)
}

while stack.isEmpty == false {
    guard let temp = stack.popLast() else { fatalError() }
    if !visit.contains(temp) {
        visit.append(temp)
        
        guard let temp2 = arr[temp] else { fatalError() }
        
        stack += temp2
    }
}

for i in visit {
    dfsAnswer += String(i) + " "
}

print(dfsAnswer)

var queue = [V]
visit = [Int]()

var bfsAnswer = ""

for key in arr.keys {
    arr[key]!.sort(by: <)
}

while queue.isEmpty == false {
    let node = queue.remove(at: 0) // 제일 앞에꺼 pop
    if !visit.contains(node) {
        visit.append(node)
        
        guard let temp2 = arr[node] else { fatalError() }
        
        queue += temp2
    }
}

for i in visit {
    bfsAnswer += String(i) + " "
}

print(bfsAnswer)

