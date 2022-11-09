//  백준 - A와 B 2
//  https://www.acmicpc.net/problem/12919
//  Created by 홍은표 on 2022/11/09.

import Foundation

let S = readLine()!
let T = readLine()!
var answer = 0

func removeA(_ str: String) -> String {
    var newStr = str
    newStr.removeLast()
    return newStr
}

func removeB(_ str: String) -> String {
    var newStr = String(str.reversed())
    newStr.removeLast()
    return newStr
}

func dfs(_ str: String) {
    if str == S {
        answer = 1
        return
    }
    
    if str.count <= S.count || answer == 1 {
        return
    }
    
    if str.first! == "B" {
        dfs(removeB(str))
    }
    
    if str.last! == "A" {
        dfs(removeA(str))
    }
}

dfs(T)

print(answer)
