//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/02.
//
// 14503번 로봇청소기

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (nm[0], nm[1])
let rcd = readLine()!.split(separator: " ").map{Int(String($0))!}
let (r, c, d) = (rcd[0], rcd[1], rcd[2])
var arr = [[Int]]()
for _ in 0..<n{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var answer = 1
visited[r][c] = true
var curD = d
var curR = r
var curC = c
var cnt = 0
while true {
    curD -= 1
    if curD == -1 { curD = 3 }
    
    var nx = curR + dx[curD]
    var ny = curC + dy[curD]
    if !visited[nx][ny] && arr[nx][ny] != 1 {
        visited[nx][ny] = true
        curR = nx
        curC = ny
        answer += 1
        cnt = 0
        print(curR, curC)
        continue
    } else {
        cnt += 1
    }
    if cnt == 4 {
        cnt = 0
        nx = curR - dx[curD]
        ny = curC - dy[curD]
        if arr[nx][ny] != 1 {
            curR = nx
            curC = ny
            print("back", curR, curC)
        } else {
            break
        }
    }
}
print(answer)
