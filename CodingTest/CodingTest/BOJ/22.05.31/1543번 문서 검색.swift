//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/05/31.
//

import Foundation

let docs = readLine()!.map { String($0) }
let find = readLine()!.map { String($0) }

let docsCount = docs.count
let findCount = find.count

var result = 0

var i = 0

while i < docsCount {
    let endIndex = i + findCount
    if endIndex <= docsCount {
        let sub = docs[i...i+findCount-1]
        if sub.elementsEqual(find) == true {
            i = i+findCount-1
            result += 1
        }
    } else {
        break
    }
    i += 1
}

print(result)
