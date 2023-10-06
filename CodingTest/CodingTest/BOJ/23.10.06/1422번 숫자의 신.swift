//  백준 - 숫자의 신
//  https://www.acmicpc.net/problem/1422
//  Created by 홍은표 on 23/10/06.

import Foundation

let KN = readLine()!.split(separator: " ").map { Int(String($0))! }
let (K, N) = (KN[0], KN[1])
var T = ""
var A = [String]()
for _ in (0..<K) {
    let I = String(readLine()!)
    if T.count < I.count || (T.count == I.count && T < I) {
        T = I
    }
    A.append(I)
}
A.append(String(repeating: T, count: N-K))
print(A.sorted(by: { $0 + $1 > $1 + $0 }).joined())
