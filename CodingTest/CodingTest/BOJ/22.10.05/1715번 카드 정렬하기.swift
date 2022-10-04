//  백준 - 카드 정렬하기
//  https://www.acmicpc.net/problem/1715
//  Created by 홍은표 on 2022/10/05.

import Foundation

struct MinHeap<T: Comparable> {
    private var heap: Array<T> = []
    var isEmpty: Bool { heap.count <= 1 }
    var count: Int { heap.count - 1 }
    
    init() { }
    init(_ data: T) {
        heap.append(data)       // 0번 index 채우기용
        heap.append(data)       // 실제 Root Node 채우기
    }
    
    mutating func insert(_ data: T) {
        if heap.isEmpty {
            heap.append(data)
            heap.append(data)
            return
        }
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {               // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightCildIndex = leftChildIndex + 1
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= (heap.count) {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우
            if rightCildIndex >= (heap.count) {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 작은 경우
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightCildIndex] > heap[poppedIndex]) {
                return .none
            }
            
            // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightCildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightCildIndex] ? .left : .right
            }
            
            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 작은 경우
            if (heap[leftChildIndex] < heap[poppedIndex]) || (heap[rightCildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightCildIndex] ? .left : .right
            }
            return .none
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
                
            }
        }
    }
}

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

var heap: MinHeap<Int> = MinHeap()
let N = readInt()
for _ in 0..<N {
    heap.insert(readInt())
}

var answer = 0
while heap.count != 1 {
    let n1 = heap.pop()!
    let n2 = heap.pop()!
    answer += n1 + n2
    heap.insert(n1 + n2)
}

print(answer)
