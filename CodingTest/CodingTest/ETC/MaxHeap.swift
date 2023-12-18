//  MaxHeap.swift

import Foundation

struct MaxHeap {
    private var elements = [Int]()
    
    mutating func insert(_ element: Int) {
        elements.append(element)
        shiftUp(elements.count - 1)
    }
    
    mutating private func shiftUp(_ index: Int) {
        var child = index
        var parent = parentIndex(index)
        while child > 0 && elements[child] > elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
    
    mutating func pop() -> Int? {
        guard !elements.isEmpty else { return nil }
        
        elements.swapAt(0, elements.count - 1)
        let element = elements.removeLast()
        shiftDown(0)
        return element
    }
    
    mutating private func shiftDown(_ index: Int) {
        var parent = index

        while true {
            let lChild = leftChildIndex(parent)
            let rChild = rightChildIndex(parent)
            var candidate = parent

            if lChild < elements.count && elements[lChild] > elements[candidate] {
                candidate = lChild
            }

            if rChild < elements.count && elements[rChild] > elements[candidate] {
                candidate = rChild
            }

            if parent == candidate { break }

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
