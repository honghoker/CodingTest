//  프로그래머스 - 뒤에 있는 큰 수 찾기
//  https://school.programmers.co.kr/learn/courses/30/lessons/154539
//  Created by 홍은표 on 2023/01/26.

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = [Int]()
    var stack = [(Int, Int)]()
    for i in 0..<numbers.count {
        answer.append(-1)
        while !stack.isEmpty {
            if stack.last!.1 >= numbers[i] { break }
            answer[stack.removeLast().0] = numbers[i]
        }
        stack.append((i, numbers[i]))
    }
    
    return answer
}
