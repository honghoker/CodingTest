//  백준 - 뉴스 전하기
//  https://www.acmicpc.net/problem/1135
//  Created by 홍은표 on 2023/06/25.

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dist = [[Int]](repeating: [], count: N)
for i in 1..<N { dist[arr[i]].append(i) }

func dfs(_ node: Int) -> Int {
    if dist[node].isEmpty { return 0 }
    var times = dist[node].map { dfs($0) }.sorted(by: >)
    for i in 0..<times.count { times[i] += i + 1 }
    return times.max()!
}
print(dfs(0))
