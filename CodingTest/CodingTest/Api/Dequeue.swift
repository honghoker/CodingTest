//
//  Dequeue.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/06.
//

class Dequeue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    init(_ queue: [T]) {
        enQueue = queue
    }
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    var last: T? {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.last
    }
    
    var first: T? {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.last
    }

    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func popLast() -> T? {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()
    }
    
    func popFirst() -> T? {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()
    }
}
