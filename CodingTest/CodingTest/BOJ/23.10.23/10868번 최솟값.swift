//  백준 - 최솟값
//  https://www.acmicpc.net/problem/10868
//  Created by 홍은표 on 10/23/23.

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

class SegmentTree {
    var N: Int
    var tree: [Int]
    
    init(_ arr: [Int]) {
        self.N = arr.count
        self.tree = [Int](repeating: Int.max, count: N * 4)
        build(arr, 1, 0, N - 1)
    }
    
    private func merge(_ left: Int, _ right: Int) -> Int {
        return min(left, right)
    }
    
    private func build(_ arr: [Int], _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) -> Int {
        if nodeLeft == nodeRight {
            tree[node] = arr[nodeLeft]
            return tree[node]
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        let leftVal = build(arr, node * 2, nodeLeft, mid)
        let rightVal = build(arr, node * 2 + 1, mid + 1, nodeRight)
        tree[node] = merge(leftVal, rightVal)
        return tree[node]
    }
    
    func update(_ index: Int, _ newValue: Int) -> Int {
        return updateRec(index, newValue, 1, 0, N - 1)
    }
    
    private func updateRec(_ index: Int, _ newValue: Int, _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) -> Int {
        if index < nodeLeft || nodeRight < index {
            return tree[node]
        }
        
        if nodeLeft == nodeRight {
            tree[node] = newValue
            return tree[node]
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        let leftVal = updateRec(index, newValue, node * 2, nodeLeft, mid)
        let rightVal = updateRec(index, newValue, node * 2 + 1, mid + 1, nodeRight)
        tree[node] = merge(leftVal, rightVal)
        return tree[node]
    }
    
    func query(_ left: Int, _ right: Int) -> Int {
        return queryRec(left, right, 1, 0, N - 1)
    }
    
    private func queryRec(_ left: Int, _ right: Int, _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) -> Int {
        if right < nodeLeft || nodeRight < left {
            return Int.max
        }
        
        if left <= nodeLeft && nodeRight <= right {
            return tree[node]
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        let leftVal = queryRec(left, right, node * 2, nodeLeft, mid)
        let rightVal = queryRec(left, right, node * 2 + 1, mid + 1, nodeRight)
        return merge(leftVal, rightVal)
    }
}

let (N, M) = (readInt(), readInt())
let A = (0..<N).map { _ in readInt() }
let tree = SegmentTree(A)
var r = ""
for _ in 0..<M {
    let (a, b) = (readInt(), readInt())
    r += "\(tree.query(a-1, b-1))\n"
}
print(r)
