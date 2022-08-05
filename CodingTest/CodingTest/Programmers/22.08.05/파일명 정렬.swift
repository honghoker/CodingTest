//
//  파일명 정렬.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/05.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    var HNT = [(Int, String, String, String)]()
    for i in 0..<files.count {
        let file = files[i].map{$0}
        var idx = 0
        var head = ""
        
        while idx < file.count {
            if !file[idx].isNumber {
                head.append(file[idx])
            } else {
                break
            }
            
            idx += 1
        }
        
        var number = ""
        
        while idx < file.count {
            if file[idx].isNumber {
                number.append(file[idx])
            } else {
                break
            }
            
            idx += 1
        }
            
        
        var tail = file[idx...].map{String($0)}.joined()

        HNT.append((i, head, number, tail))
    }
    
    HNT.sort {
        if $0.1.uppercased() == $1.1.uppercased() {
            if Int($0.2)! == Int($1.2)! {
                return $0.0 < $1.0
            } else {
                return Int($0.2)! < Int($1.2)!
            }
        } else {
            return $0.1.uppercased() < $1.1.uppercased()
        }
    }

    return HNT.map { "\($0.1)\($0.2)\($0.3)" }
}
