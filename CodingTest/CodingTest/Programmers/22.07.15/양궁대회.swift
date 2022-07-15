//
//  양궁대회.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/15.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var answer = Array(repeating: 0, count: 11)
    var testArr = [[Int]]()
    var maxDiffScore = 0
    var appeachScore = 0
    for i in 0...10 {
        if info[i] != 0 {
            appeachScore += (10 - i)
        }
    }
    
    func dfs(_ arr: [Int], _ arrow: Int, _ appeachScore: Int, _ ryanScore: Int, _ now: Int) {
        if arrow == 0 {
            if appeachScore < ryanScore {
                if maxDiffScore < ryanScore - appeachScore {
                    testArr = []
                    testArr.append(arr)
                    maxDiffScore = ryanScore - appeachScore
                } else if maxDiffScore == ryanScore - appeachScore {
                    testArr.append(arr)
                }
            }
            return
        }
        var arr = arr
        for i in now...10 {
            if i == 10 {
                arr[i] = arrow
                dfs(arr, 0, appeachScore, ryanScore, i)
                arr[i] = 0
            } else if info[i] + 1 <= arrow && arr[i] == 0 {
                arr[i] = info[i] + 1
                
                dfs(arr, arrow - (info[i] + 1), info[i] == 0 ? appeachScore : appeachScore - (10-i), ryanScore + (10-i), i)
                arr[i] = 0
            }
        }
    }
    
    dfs(answer, n, appeachScore, 0, 0)
    if testArr.isEmpty { return [-1] }
    else {
        testArr.sort { $0.filter { $0 != 0 }.count > $1.filter { $0 != 0 }.count }
        return testArr[0]
     }
}
