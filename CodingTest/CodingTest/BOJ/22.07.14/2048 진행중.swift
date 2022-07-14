//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/06.
//

import Foundation

let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var answer = 0

func top(_ map: [[Int]]) -> [[Int]] {
    var map = map
    for j in 0..<N {
        for i in 1..<N {
            if map[i][j] != 0 {
                var idx = i-1
                while idx >= 0 {
                    if map[idx][j] == 0 {
                        map[idx][j] = map[idx+1][j]
                        map[idx+1][j] = 0
                    } else if map[idx][j] == map[idx+1][j] {
                        map[idx][j] = map[idx+1][j] * 2
                        map[idx+1][j] = 0
                    } else { break }
                    idx -= 1
                }
            }
        }
    }
    return map
}

func bottom(_ map: [[Int]]) -> [[Int]] {
    var map = map
    for j in 0..<N {
        for i in stride(from: N-2, through: 0, by: -1) {
            if map[i][j] != 0 {
                var idx = i+1
                while idx < N {
                    if map[idx][j] == 0 {
                        map[idx][j] = map[idx-1][j]
                        map[idx-1][j] = 0
                    } else if map[idx][j] == map[idx-1][j] {
                        map[idx][j] = map[idx-1][j] * 2
                        map[idx-1][j] = 0
                    } else { break }
                    idx += 1
                }
            }
        }
    }
    return map
}

func left(_ map: [[Int]]) -> [[Int]] {
    var map = map
    for i in 0..<N {
        for j in 1..<N {
            if map[i][j] != 0 {
                var idx = j-1
                while idx >= 0 {
                    if map[i][idx] == 0 {
                        map[i][idx] = map[i][idx+1]
                        map[i][idx+1] = 0
                    } else if map[i][idx] == map[i][idx+1] {
                        map[i][idx] = map[i][idx+1] * 2
                        map[i][idx+1] = 0
                    } else { break }
                    idx -= 1
                }
            }
        }
    }
    return map
}

func right(_ map: [[Int]]) -> [[Int]] {
    var map = map
    for i in 0..<N {
        for j in stride(from: N-2, through: 0, by: -1) {
            if map[i][j] != 0 {
                var idx = j+1
                while idx < N {
                    if map[i][idx] == 0 {
                        map[i][idx] = map[i][idx-1]
                        map[i][idx-1] = 0
                    } else if map[i][idx] == map[i][idx-1] {
                        map[i][idx] = map[i][idx-1] * 2
                        map[i][idx-1] = 0
                    } else { break }
                    idx += 1
                }
            }
        }
    }
    return map
}

//4
//2 0 2 8
//0 0 2 2
//0 0 0 0
//0 0 0 0

//4
//2 4 16 8
//8 4 0 0
//16 8 2 0
//2 8 2 0


//func dfs(_ map: [[Int]], _ depth: Int) {
//    var map = map
//    if depth == 5 {
//        for map in map {
//            print(map)
//        }
//        print("---------")
//        return
//    }
//
//    dfs(left(map), depth + 1)
//    dfs(right(map), depth + 1)
//    dfs(top(map), depth + 1)
//    dfs(bottom(map), depth + 1)
//
//}
//dfs(map, 0)

let result = left(map)
for r in result {
    print(r)
}
//left(map)

print(answer)
