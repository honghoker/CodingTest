//
//  12851번 숨바꼭질2
//  CodingTest
//
//  Created by 홍은표 on 2022/06/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])

var minDist = Array(repeating: 987654321, count: 100001)

var queue = [(N, 0)]
var front = 0
var minDistCount = 0

while true {
    if front == queue.count { break }
    
    let x = queue[front].0
    let dist = queue[front].1
    
    if dist > minDist[K] { break }
    
    front += 1
    
    if x == K {
        minDist[K] = dist
        minDistCount += 1
    }
    
    let nexts = [x + 1, x - 1, x * 2]
    for next in nexts {
        if next >= 0 && next <= 100000 && (dist + 1) <= minDist[next] {
            minDist[next] = dist + 1
            queue.append((next, dist + 1))
        }
    }
}

print(minDist[K])
print(minDistCount)
