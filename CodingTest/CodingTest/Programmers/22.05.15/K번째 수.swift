//
//  K번째 수
//  CodingTest
//
//  Created by 홍은표 on 2022/05/15.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands {
        let i = command[0] - 1
        let j = command[1] - 1
        let k = command[2] - 1
        let number = Array(array[i...j]).sorted()[k]
        result.append(number)
    }
    
    // 짧은 버전
//    commands.forEach {
//        result.append(Array(array[$0[0]-1...$0[1]-1]).sort()[$0[2]-1])
//    }
    
    return result
}

