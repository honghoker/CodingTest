//  백준 - 궁금한 민호
//  https://www.acmicpc.net/problem/1507
//  Created by 홍은표 on 23/12/10.

// 풀이
// i != k, i != j, k != j 조건이 있는 이유
// 조건이 없다면 서로 다른 두다리(i -> k -> j)를 이용했을 때와, 하나의 다리(i -> j)를 이용했을 때를 비교할 때
// A[i][j] == 0 + A[i][j]와 같은 조건에서도 만족이 되기 때문에 현재 다리를 없애버리는 코드가 됨

// if A[i][j] > A[i][k] + A[k][j] { return -1 } 조건이 있는 이유
// 주어진 도시가 최단 거리이므로, i -> j가 이미 최단 경로여야 한다.
// 즉, i -> k -> j 가 i -> j 보다 무조건 최단 경로가 아니어야 한다.

import Foundation

let N = Int(readLine()!)!
let A = (0..<N).map { _ in readLine()!.split(separator: " ").map { Int(String($0))! } }
var floyd: Int {
    var r = A
    for k in 0..<N {
        for i in 0..<N where i != k {
            for j in 0..<N where i != j && k != j {
                if A[i][j] > A[i][k] + A[k][j] { return -1 }
                if A[i][j] == A[i][k] + A[k][j] { r[i][j] = 0 }
            }
        }
    }
    return r.map { $0.reduce(0, +) }.reduce(0, +) / 2
}
print(floyd)
