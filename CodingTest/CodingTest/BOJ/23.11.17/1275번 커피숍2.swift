//  백준 - 커피숍2
//  https://www.acmicpc.net/problem/1275
//  Created by 홍은표 on 23/11/17.

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

class SegmentTree {
    private var tree: [Int]
    private var n: Int
    
    init(_ arr: [Int]) {
        n = arr.count
        tree = [Int](repeating: 0, count: n * 4)
        build(arr, 0, 0, n - 1)
    }
    
    private func merge(_ left: Int, _ right: Int) -> Int {
        return left + right
    }
    
    private func build(_ arr: [Int], _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) {
        if nodeLeft == nodeRight {
            tree[node] = arr[nodeLeft]
            return
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        build(arr, node * 2 + 1, nodeLeft, mid)
        build(arr, node * 2 + 2, mid + 1, nodeRight)
        tree[node] = merge(tree[node * 2 + 1], tree[node * 2 + 2])
    }
    
    func update(_ index: Int, _ newValue: Int) {
        updateRec(index, newValue, 0, 0, n - 1)
    }
    
    private func updateRec(_ index: Int, _ newValue: Int, _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) {
        if index < nodeLeft || nodeRight < index {
            return
        }
        if nodeLeft == nodeRight {
            tree[node] = newValue
            return
        }
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        updateRec(index, newValue, node * 2 + 1, nodeLeft, mid)
        updateRec(index, newValue, node * 2 + 2, mid + 1, nodeRight)
        tree[node] = merge(tree[node * 2 + 1], tree[node * 2 + 2])
    }
    
    func query(_ left: Int, _ right: Int) -> Int {
        queryRec(left, right, 0, 0, n - 1)
    }
    
    private func queryRec(_ left: Int, _ right: Int, _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) -> Int {
        if right < nodeLeft || nodeRight < left {
            return 0
        }
        if left <= nodeLeft && nodeRight <= right {
            return tree[node]
        }
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        let leftVal = queryRec(left, right, node * 2 + 1, nodeLeft, mid)
        let rightVal = queryRec(left, right, node * 2 + 2, mid + 1, nodeRight)
        return merge(leftVal, rightVal)
    }
}

let (N, Q) = (readInt(), readInt())
let tree = SegmentTree((0..<N).map { _ in readInt() })
var r = ""
for _ in 0..<Q {
    let (x, y, a, b) = (readInt() - 1, readInt() - 1, readInt() - 1, readInt())
    r += "\(tree.query(min(x, y), max(x, y)))\n"
    tree.update(a, b)
}
print(r)
