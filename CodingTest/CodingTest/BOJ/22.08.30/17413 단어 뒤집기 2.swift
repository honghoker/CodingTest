//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/30.
//

import Foundation

var S = readLine()!.map { String($0) }
var tag = ""
var word = ""

for ch in S {
    if ch == "<" {
        tag.append(ch)
        if !word.isEmpty {
            print(String(word.reversed()), terminator: "")
            word = ""
        }
    } else if ch == ">" {
        tag.append(ch)
        print(tag, terminator: "")
        tag = ""
    } else {
        if tag.first == "<" {
            tag.append(ch)
        } else if ch == " " {
            print(String(word.reversed()), terminator: " ")
            word = ""
        } else {
            word.append(ch)
        }
    }
}

if !word.isEmpty {
    print(String(word.reversed()), terminator: "")
}
