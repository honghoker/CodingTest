//
//  가장 큰 수
//  CodingTest
//
//  Created by 홍은표 on 2022/05/15.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var stringArray = numbers.map { String($0) }
    stringArray.sort() {
        return $0 + $1 > $1 + $0
    }
    if stringArray[0] == "0" {
        return "0"
    }
    return stringArray.joined()
}

print(solution([4, 0, 0]))
