//
//  문자열 압축.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/27.
//

import Foundation

func solution(_ s:String) -> Int {
    var answer = Int.max
    let str = s.map{$0}
    let length = str.count
    let maxSub = str.count / 2
    if maxSub == 0 {
        return str.count
    }

    func slicing(_ sub: Int) -> [String] {
        var result = [String]()
        
        for i in stride(from: sub-1, to: length, by: sub) {
            let word = str[(i-sub+1)...i].map{ String($0) }.joined()
            result.append(word)
        }
        
        if length % sub > 0 {
            result.append(String(str[(length-length % sub)...]))
        }
        
        return result
    }
    
    func compress(_ slicingStr: [String]) -> Int {
        var count = 1
        var result = ""
        for i in 0..<slicingStr.count - 1 {
            if slicingStr[i] == slicingStr[i+1] {
                count += 1
            } else {
                if count == 1 {
                    result += slicingStr[i]
                } else {
                    result += "\(count)\(slicingStr[i])"
                    count = 1
                }
            }
        }
        if count == 1 {
            result += slicingStr[slicingStr.count-1]
        } else {
            result += "\(count)\(slicingStr[slicingStr.count-1])"
            count = 1
        }
        
        return result.count
    }
    
    for i in 1...maxSub {
        let slicingStr = slicing(i)
        
        answer = min(answer, compress(slicingStr))
    }
    
    return answer == Int.max ? 0 : answer
}
