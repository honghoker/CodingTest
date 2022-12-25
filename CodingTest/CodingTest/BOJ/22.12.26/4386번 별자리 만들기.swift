//  백준 - 별자리 만들기
//  https://www.acmicpc.net/problem/4386
//  Created by 홍은표 on 2022/12/26.

import Foundation

let N = Int(readLine()!)!
var nodes = [(Double, Double)]()

var parents = [Int]()
var dists = [(Int, Int, Double)]()

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Double(String($0))! }
    let (u, v) = (input[0], input[1])
    nodes.append((u, v))
    for j in 0..<nodes.count - 1{
        let x_dist = pow(nodes[i].0 - nodes[j].0, 2)
        let y_dist = pow(nodes[i].1 - nodes[j].1, 2)
        let dist = sqrt(x_dist + y_dist)
        dists.append((j, i, dist))
    }
    parents.append(i)
}
dists.sort(by: { $0.2 < $1.2 })

func find(_ u: Int) -> Int {
    if parents[u] == u { return u }
    else {
        parents[u] = find(parents[u])
        return parents[u]
    }
}

func make_union(_ u: Int, _ v: Int) {
    if u > v { parents[u] = v }
    else if u < v { parents[v] = u }
}

func union_find(_ u: Int, _ v: Int) -> Bool {
    let u = find(u)
    let v = find(v)
    if u == v { return true }
    else {
        make_union(u, v)
        return false
    }
}

var answer = 0.0
var count = 0
for i in 0..<dists.count {
    if count == N - 1 { break }
    let (u, v, cost) = dists[i]
    if !union_find(u, v) { answer += cost; count += 1 }
}
print(round(answer * 100) / 100)
