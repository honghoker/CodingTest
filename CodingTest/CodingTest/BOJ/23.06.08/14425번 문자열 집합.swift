//  백준 - 문자열 집합
//  https://www.acmicpc.net/problem/14425
//  Created by 홍은표 on 2023/06/08.

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (nm[0], nm[1])
let str = Set((0..<N).map { _ in readLine()! })
print((0..<M).filter { _ in str.contains(readLine()!) }.count)
