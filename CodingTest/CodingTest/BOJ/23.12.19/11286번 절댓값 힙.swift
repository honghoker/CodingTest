//  백준 - 절댓값 힙
//  https://www.acmicpc.net/problem/11286
//  Created by 홍은표 on 23/12/19.

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

@inline(__always) func readString() -> String {
    var now = read()
    
    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    let beginIndex = bIdx-1
    
    while now != 10,
          now != 32,
          now != 0 { now = read() }
    
    return String(bytes: Array(buffer[beginIndex..<(bIdx-1)]), encoding: .ascii)!
}

struct MinHeap {
    private var elements = [Int]()
    
    mutating func insert(_ val: Int) {
        elements.append(val)
        shiftUp(elements.count-1)
    }
    
    mutating private func shiftUp(_ index: Int) {
        var child = index
        var parent = parentIndex(index)
        
        while child > 0 && (abs(elements[child]) < abs(elements[parent]) || (abs(elements[child]) == abs(elements[parent]) && elements[child] < elements[parent])) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
    
    mutating func pop() -> Int? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count-1)
        let val = elements.removeLast()
        shiftDown(0)
        return val
    }
    
    mutating private func shiftDown(_ index: Int) {
        var parent = index
        while true {
            let lC = leftChildIndex(parent)
            let rC = rightChildIndex(parent)
            var candidate = parent
            
            if lC < elements.count && (abs(elements[lC]) < abs(elements[candidate]) || (abs(elements[lC]) == abs(elements[candidate]) && elements[lC] < elements[candidate])) {
                candidate = lC
            }
            
            if rC < elements.count && (abs(elements[rC]) < abs(elements[candidate]) || (abs(elements[rC]) == abs(elements[candidate]) && elements[rC] < elements[candidate])) {
                candidate = rC
            }
            
            if parent == candidate {
                break
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(_ index: Int) -> Int {
        (index - 1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        index * 2 + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        index * 2 + 2
    }
}

var heap = MinHeap(), r = ""
for _ in 0..<readInt() {
    let I = readInt()
    if I == 0 { r += "\(heap.pop() ?? 0)\n" }
    else { heap.insert(I) }
}
print(r)
