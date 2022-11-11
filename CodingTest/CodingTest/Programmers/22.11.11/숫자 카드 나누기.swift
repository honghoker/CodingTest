//  프로그래머스 - 숫자 카드 나누기
//  https://school.programmers.co.kr/learn/courses/30/lessons/135807
//  Created by 홍은표 on 2022/11/11.

import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let sortedA = arrayA.sorted()
    let sortedB = arrayB.sorted()

    let A = findMaxNumber(sortedA, sortedB)
    let B = findMaxNumber(sortedB, sortedA)
    return max(A, B)
}

func findMaxNumber(_ divideArr: [Int], _ nonDivideArr: [Int]) -> Int {
    var mod = divideArr[0]
    for i in 0..<divideArr.count {
        guard nonDivideArr[i] % mod != 0 else {
            return 0
        }
        if divideArr[i] % mod != 0 {
            mod = findGCD(mod, divideArr[i])
            if mod == 1 {
                return 0
            }
        }
    }
    return mod
}

func findGCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return findGCD(b, a % b)
    }
}
