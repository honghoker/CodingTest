//
//  메뉴 리뉴얼.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/07/29.
//
import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    let orders = orders.map { $0.sorted() }
    var menu = [String: Int]()
    var answer = [String]()
    
    func dfs(_ order: [Character], _ str: String, _ now: Int, _ size: Int) {
        if str.count == size {
            menu[str, default: 0] += 1
            return
        }
        
        var str = str
        
        for i in now..<order.count {
            str.append(order[i])
            dfs(order, str, i + 1, size)
            str.removeLast()
        }
    }
    
    for order in orders {
        for i in course {
            dfs(order, "", 0, i)
        }
    }
    
    menu = menu.filter { $0.value >= 2 }
    for i in course {
        let max = menu.filter { $0.key.count == i }.max { $0.value < $1.value }
        if let max = max {
            answer += menu.filter { $0.key.count == i && $0.value == max.value }.keys
        }
    }
    
    return answer.sorted()
}
