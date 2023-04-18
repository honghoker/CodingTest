//  백준 - 악보는 거들 뿐
//  https://www.acmicpc.net/problem/27972
//  Created by 홍은표 on 2023/04/16.

import Foundation

let M = Int(readLine()!)!
var notes = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()
var isUp = true
var answer = 0

for note in notes {
    guard let last = stack.last else {
        stack.append(note)
        continue
    }
    if stack.count == 1 {
        if last != note {
            isUp = last < note
            stack.append(note)
        }
    } else if last != note {
        let shouldResetStack = (last < note && !isUp) || (last > note && isUp)
        if shouldResetStack {
            answer = max(answer, stack.count)
            stack = [last]
            isUp = last < note
        }
        stack.append(note)
    }
}

print(max(answer, stack.count))
