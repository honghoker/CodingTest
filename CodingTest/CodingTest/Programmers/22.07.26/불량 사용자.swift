//
//  불량 사용자.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/26.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var user_id_map = [[String]]()
    var id_List: [[String]] = Array(repeating: [], count: banned_id.count)
    
    
    for i in 0..<user_id.count {
        user_id_map.append(user_id[i].map{String($0)})
    }
    
    for i in 0..<banned_id.count {
        let banId = banned_id[i].map{ String($0) }
        var arr = user_id_map.filter { $0.count == banId.count }
        
        for j in 0..<banId.count {
            if banId[j] != "*" {
                arr = arr.filter { $0[j] == banId[j] }
            }
        }
        
        for j in 0..<arr.count {
            id_List[i].append((arr[j].joined()))
        }
    }
    
    var visit = [String]()
    var answerArr = [String]()
    
    func dfs(_ depth: Int) {
        if depth == id_List.count {
            let value = visit.sorted().flatMap{String($0)}.joined()
            if !answerArr.contains(value) {
                answerArr.append(value)
            }
            
            return
        }
        
        for i in 0..<id_List[depth].count {
            if !visit.contains(id_List[depth][i]) {
                visit.append(id_List[depth][i])
                dfs(depth + 1)
                visit.removeLast()
            }
        }
    }
    dfs(0)
    
    return answerArr.count
}
