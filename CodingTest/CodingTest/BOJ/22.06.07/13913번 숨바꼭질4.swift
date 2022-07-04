//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/06.
//

class Dequeue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init(_ queue: [T]) {
        enQueue = queue
    }
    
    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }
    
    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}


let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var queue = Dequeue([(N, 0)])
var visit = Array(repeating: false, count: 100001)
var minDist = Array(repeating: -1, count: 100001)
visit[N] = true
minDist[N] = 0
while !queue.isEmpty {
    let node = queue.popFirst()
    let x = node.0
    let dist = node.1
    
    if x == K {
        print(dist)
        break
    }
    
    if x * 2 <= 100000 && visit[x * 2] == false {
        queue.pushLast((x * 2, dist + 1))
        visit[x * 2] = true
        minDist[x * 2] = x
    }
    if x - 1 >= 0 && visit[x - 1] == false  {
        queue.pushLast((x - 1, dist + 1))
        visit[x - 1] = true
        minDist[x - 1] = x
    }
    if x + 1 <= 100000 && visit[x + 1] == false  {
        queue.pushLast((x + 1, dist + 1))
        visit[x + 1] = true
        minDist[x + 1] = x
    }
}

var idx = K
var result = [K]

while idx != N {
    let dist = minDist[idx]
    result.append(dist)
    idx = dist
}
result.reverse()
print(result.map { String($0) }.joined(separator: " "))
