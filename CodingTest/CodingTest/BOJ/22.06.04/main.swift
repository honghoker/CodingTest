//
//  12851번 숨바꼭질2
//  CodingTest
//
//  Created by 홍은표 on 2022/06/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var arr = Array(repeating: 987654321, count: 100001)
//var visit = Array(repeating: false, count: 100001)

var queue = [(N, 0)]
arr[N] = 0

var minKCount = 0

while !queue.isEmpty {
    let node = queue.removeFirst()
    let x = node.0
    let dist = node.1
    
    if dist > arr[N] { break }
    
    if x == N {
        
    }
    
    let nexts = [x + 1, x - 1, x * 2]
    
    
    for next in nexts {
        if next >= 0 && next <= 100000 && (dist + 1) <= arr[dist] {
            arr[next] = dist + 1
            queue.append((next, dist + 1))
        }
    }
}

print(arr[K])
print(minKCount)
