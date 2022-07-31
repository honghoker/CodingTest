//
//  순위 검색.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/08/01.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var answer = [Int]()
    var db = [String: [Int]]()
    
    for i in info {
        let infos = i.split(separator: " ").map { String($0) }
        let langs = [infos[0], "-"]
        let jobs = [infos[1], "-"]
        let careers = [infos[2], "-"]
        let foods = [infos[3], "-"]
        let score = Int(infos[4])!
        
        for lang in langs {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        let key = "\(lang) \(job) \(career) \(food)"
                        db[key, default: []].append(score)
                    }
                }
            }
        }
    }

    for d in db {
        let sortValue = d.value.sorted()
        db[d.key] = sortValue
    }
    
    for q in query {
        let q = q.split(separator: " ")
        
        let lang = q[0]
        let job = q[2]
        let career = q[4]
        let food = q[6]
        let score = Int(q[7])!
        
        let key = "\(lang) \(job) \(career) \(food)"
        
        if let match = db[key] {
            var low = 0, high = match.count
            while low < high {
                let mid = (low + high) / 2
                
                if match[mid] >= score {
                    high = mid
                } else {
                    low = mid + 1
                }
            }
            answer.append(match.count - low)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}
