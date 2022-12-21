//  백준 - 멀티탭 스케줄링
//  https://www.acmicpc.net/problem/1700
//  Created by 홍은표 on 2022/12/21.

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (input[0], input[1])
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var state = [Int]()
var answer = 0

for i in 0..<arr.count {
    if state.contains(arr[i]) { continue }
    if state.count < N { state.append(arr[i]) }
    else {
        var maxIndex = -1
        var maxVal = -1
        for val in state {
            if let index = arr[i+1..<K].firstIndex(where: { $0 == val }) {
                if maxIndex < index {
                    maxIndex = index
                    maxVal = val
                }
            } else {
                maxVal = val; break
            }
        }
        if let index = state.firstIndex(where: { $0 == maxVal }) {
            state[index] = arr[i]
            answer += 1
        }
    }
}

print(answer)
