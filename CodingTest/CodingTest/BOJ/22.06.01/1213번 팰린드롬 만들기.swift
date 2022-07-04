//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/01.
//

let input = readLine()!.map { String($0) }.sorted(by: <)
var alphabet = Array(repeating: 0, count: 26) // 알파벳 개수 카운팅

for ch in input {
    let index = Int(UnicodeScalar(ch)!.value) - Int(UnicodeScalar(65).value)
    alphabet[index] += 1
}

var cnt = 0 // 홀수 갯수 체크, 1 이상이면 팰린드롬 불가능.
var idx = -1 // 홀수 인덱스 저장
for i in 0..<26 {
    if alphabet[i] % 2 == 1 {
        cnt += 1
        idx = i
    }
}

if cnt > 1 {
    print("I'm Sorry Hansoo")
} else {
    var answer = ""
    
    for i in 0..<26 {
        for _ in 0..<alphabet[i]/2 {
            answer += String(UnicodeScalar(65 + i)!)
        }
    }
    if idx != -1 {
        answer += String(UnicodeScalar(65 + idx)!)
    }
    for i in stride(from: 25, through: 0, by: -1) {
        for _ in 0..<alphabet[i]/2 {
            answer += String(UnicodeScalar(65 + i)!)
        }
    }
    print(answer)
}
