//
//  없는 숫자 더하기
//  CodingTest
//
//  Created by 홍은표 on 2022/05/15.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    let totalSum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
    return totalSum - numbers.reduce(0) { $0 + $1 }
//    return (0...9).filter { !numbers.contains($0) }.reduce(0, +) 다른 방법
}

//let N = Int(readLine()!)!
let intArr = readLine()!.split(separator: " ").map { Int($0)! }
print(solution(intArr))
