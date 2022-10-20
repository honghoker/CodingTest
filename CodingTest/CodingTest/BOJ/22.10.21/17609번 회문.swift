//  백준 - 회문
//  https://www.acmicpc.net/problem/17609
//  Created by 홍은표 on 2022/10/21.

import Foundation

let T = Int(readLine()!)!
var answer = ""

func palindrome(_ str: [String], _ left: Int, _ right: Int, _ isPalindrome: Int) -> Int {
    var left = left, right = right
    while left < right {
        if str[left] != str[right] {
            if isPalindrome == 1 { return 2 }
            guard right - left > 1 else { return 1 }
            if palindrome(str, left + 1, right, 1) == 1 {
                return 1
            } else {
                return palindrome(str, left, right - 1, 1)
            }
        } else {
            left += 1
            right -= 1
        }
    }
    return isPalindrome
}


for _ in 0..<T {
    let str = readLine()!.map { String($0) }
    answer += "\(palindrome(str, 0, str.count - 1, 0))\n"
}

print(answer)
