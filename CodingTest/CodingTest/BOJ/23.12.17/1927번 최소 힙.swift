//  백준 - 최소 힙
//  https://www.acmicpc.net/problem/1927
//  Created by 홍은표 on 23/12/17.

import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), bIdx = 0; buffer.append(0)

@inline(__always) func read() -> UInt8 {
    defer { bIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[bIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = read(), isNegative = false
    while byte == 10 || byte == 32 { byte = read() }
    if byte == 45 { byte = read(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = read() }
    return number * (isNegative ? -1 : 1)
}

struct MinHeap {
    var elements = [Int]()
        
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func insert(_ element: Int) {
        elements.append(element)
        shiftUp(index: count - 1)
    }
    
    mutating private func shiftUp(index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    mutating func pop() -> Int? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        shiftDown(from: 0)
        return element
    }
    
    mutating private func shiftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            
            if leftChild < count && elements[leftChild] < elements[candidate] {
                candidate = leftChild
            }
            
            if rightChild < count && elements[rightChild] < elements[candidate] {
                candidate = rightChild
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
}

var heap = MinHeap()
var r = ""
for _ in 0..<readInt() {
    let I = readInt()
    if I == 0 { r += "\(heap.pop() ?? 0)\n" }
    else { heap.insert(I) }
}
print(r)
