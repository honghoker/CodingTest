//  백준 - 로또
//  https://www.acmicpc.net/problem/6603
//  Created by 홍은표 on 2023/07/01.

import Foundation

var answer = ""
while let input = readLine(), input != "0" {
    let A = input.split(separator: " ").map { String($0) }
    let S = Array(A[1...]), K = Int(A[0])!
    
    func dfs(_ idx: Int, _ str: String, _ depth: Int) -> String {
        if depth == 6 {
            return str + "\n"
        }
        var result = ""
        for i in idx..<K {
            if i + 5 - depth < K {
                result += dfs(i+1, str.isEmpty ? S[i] : str + " " + S[i], depth + 1)
            }
        }
        
        return result
    }
    answer += dfs(0, "", 0) + "\n"
}
print(answer)
