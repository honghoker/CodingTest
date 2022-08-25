//
//  1991번 트리 순회
//  CodingTest
//
//  Created by 홍은표 on 2022/08/25.
//

import Foundation

let N = Int(readLine()!)!
var tree = [String: [String]]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree[input[0], default: []].append(contentsOf: [input[1], input[2]])
}

var answers = ["", "", ""]

func dfs(_ node: String) {
    if node == "." {
        return
    }
    answers[0] += node // 전위, root -> 좌 -> 우
    dfs(tree[node]![0])
    answers[1] += node // 중위, 좌 -> root -> 우
    dfs(tree[node]![1])
    answers[2] += node // 후위, 좌 -> 우 -> root
}

dfs("A")

for answer in answers {
    print(answer)
}
