//
//  부분집합 참고.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/06/28.
//

import Foundation

var parent = [Int]()
var node_rank = [Int]()

func find_root(_ x: Int) -> Int {
    // x가 root면 x를 반환
    if (x == parent[x]) { return x }
    
    // x가 자식 노드일 경우, 부모 노드에 대해 재귀실행
    // 이때, parent[x]를 최종적으로 찾을 root 노드로 갱신한다.
    parent[x] = find_root(parent[x])
    return parent[x]
}

func union_root(_ x: Int, _ y: Int) {
    let x = find_root(x)
    let y = find_root(y)
    
    if (x != y) {
        // 서로 다른 트리에 속한다면, 한 쪽의 트리를 다른쪽에 붙인다.
        // 항상 높이가 낮은 트리를 높이가 높은 트리에 붙인다.
        if node_rank[x] < node_rank[y] { parent[x] = y }
        else { parent[y] = x }
        
        // 만약 합친 두 트리의 높이가 같다면, 합친 후 트리의 높이를 1 증가시킨다.
        if node_rank[x] == node_rank[y] {
            parent[x] = y
            node_rank[x] += 1
        }
    }
}
