//  프로그래머스 - 스킬트리
//  https://school.programmers.co.kr/learn/courses/30/lessons/49993
//  Created by 홍은표 on 2023/03/15.

import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {
    return skill_trees.reduce(0) { count, str in
        let filtered = str.filter(skill.contains)
        return count + (skill.prefix(filtered.count) == filtered ? 1 : 0)
    }
}
