//
//  뉴스 클러스터링.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/31.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var arr1 = [String]()
    var arr2 = [String]()
    var str1 = str1.uppercased().map{$0}
    var str2 = str2.uppercased().map{$0}
    var intersection = [String]()
    var union = [String]()
    
    for i in 0..<str1.count - 1 {
        if str1[i].isLetter && str1[i+1].isLetter {
            arr1.append(String("\(str1[i])\(str1[i+1])"))
        }
    }
    for i in 0..<str2.count - 1 {
        if str2[i].isLetter && str2[i+1].isLetter {
            let str = String("\(str2[i])\(str2[i+1])")
            arr2.append(str)
            if arr1.contains(str) {
                intersection.append(str)
                arr1.remove(at: arr1.firstIndex(of: str)!)
                arr2.remove(at: arr2.firstIndex(of: str)!)
            }
        }
    }
    
    union = arr1 + arr2 + intersection
    
    return intersection.isEmpty && union.isEmpty ? 65536 : Int(Double(intersection.count) / Double(union.count) * 65536)
}
