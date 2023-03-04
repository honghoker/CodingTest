//  백준 - 토크나이저
//  https://www.acmicpc.net/problem/27649
//  Created by 홍은표 on 2023/03/04.

import Foundation

let S = readLine()!
var temp = ""
var token = [String]()
var distribute = ["<", ">", "(", ")", " "]

S.forEach {
    let ch = String($0)
    if $0.isLetter { temp.write(ch) }
    else if $0 == "&" || $0 == "|" {
        if !temp.isEmpty && (temp.last == "&" || temp.last == "|") {
            temp.write(ch)
            token.append(temp); temp = ""
        } else {
            if !temp.isEmpty { token.append(temp); temp = "" }
            temp.write(ch)
        }
    }
    else {
        if distribute.contains(ch) {
            if !temp.isEmpty { token.append(temp); temp = "" }
            token.append(ch)
        } else {
            temp.write(ch)
        }
    }
}
if !temp.isEmpty { token.append(temp) }
print(token.filter { $0 != " " }.joined(separator: " "))
