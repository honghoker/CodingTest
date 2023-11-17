//  백준 - 최솟값과 최댓값
//  https://www.acmicpc.net/problem/2357
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
    private var tree: [(min: Int, max: Int)]
    private var n: Int
    
    init(_ arr: [Int]) {
        n = arr.count
        tree = Array(repeating: (min: Int.max, max: Int.min), count: n * 4)
        build(arr, 0, 0, n - 1)
    }
    
    private func merge(_ left: (min: Int, max: Int), _ right: (min: Int, max: Int)) -> (min: Int, max: Int) {
        return (min: min(left.min, right.min), max: max(left.max, right.max))
    }
    
    private func build(_ arr: [Int], _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) {
        if nodeLeft == nodeRight {
            tree[node] = (min: arr[nodeLeft], max: arr[nodeLeft])
            return
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        build(arr, node * 2 + 1, nodeLeft, mid)
        build(arr, node * 2 + 2, mid + 1, nodeRight)
        tree[node] = merge(tree[node * 2 + 1], tree[node * 2 + 2])
    }
    
    func query(_ left: Int, _ right: Int) -> String {
        let r = queryRec(left, right, 0, 0, n - 1)
        return "\(r.min) \(r.max)\n"
    }
    
    private func queryRec(_ left: Int, _ right: Int, _ node: Int, _ nodeLeft: Int, _ nodeRight: Int) -> (min: Int, max: Int) {
        if nodeRight < left || right < nodeLeft {
            return (min: Int.max, max: Int.min)
        }
        
        if left <= nodeLeft && nodeRight <= right {
            return tree[node]
        }
        
        let mid = nodeLeft + (nodeRight - nodeLeft) / 2
        let leftResult = queryRec(left, right, node * 2 + 1, nodeLeft, mid)
        let rightResult = queryRec(left, right, node * 2 + 2, mid + 1, nodeRight)
        return merge(leftResult, rightResult)
    }
}

let (N, M) = (readInt(), readInt())
let tree = SegmentTree((0..<N).map { _ in readInt() })
var r = ""
for _ in 0..<M { r += tree.query(readInt() - 1, readInt() - 1) }
print(r)
