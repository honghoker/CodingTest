//  백준 - 센서
//  https://www.acmicpc.net/problem/2212
//  Created by 홍은표 on 2023/01/25.

import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var sensor = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var dist = [Int]()
for i in stride(from: 0, to: sensor.count - 1, by: 1) { dist.append(sensor[i+1] - sensor[i]) }
dist.sort()

var answer = 0
for i in stride(from: 0, to: N - K, by: 1) { answer += dist[i] }
print(answer)
