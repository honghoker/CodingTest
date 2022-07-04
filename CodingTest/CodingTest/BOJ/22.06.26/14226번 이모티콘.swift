//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/23.
//

import Foundation

let S = Int(readLine()!)!
var answer = 0

var queue = [(1, 0, 0)]

var visit: [[Int]] = Array(repeating: [], count: S * 2 + 1)

var front = 0
while front < queue.count {
    let node = queue[front]
    front += 1
    let now = node.0
    let clipBoard = node.1
    let time = node.2
    
    if now == S { answer = time; break }
    
    if now < visit.count && !visit[now].contains(clipBoard) {
        visit[now].append(clipBoard)
        // 화면에 있는 이모티콘 모두 복사, 클립보드 저장
        queue.append((now, now, time + 1))
        // 클립보드에 있는 모든 이모티콘 화면에 붙여넣기
        queue.append((now + clipBoard, clipBoard, time + 1))
        // 화면에 있는 이모티콘 중 하나 삭제
        if now - 1 > 0 { queue.append((now - 1, clipBoard, time + 1)) }
    }
}

print(answer)
