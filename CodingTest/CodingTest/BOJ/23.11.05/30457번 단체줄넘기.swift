//  백준 - 단체줄넘기
//  https://www.acmicpc.net/problem/30457
//  Created by 홍은표 on 23/11/5.

_ = readLine()
let A = Dictionary(readLine()!.split(separator: " ").map { (Int(String($0))!, 1) }, uniquingKeysWith: +)
print(A.map { min($0.value, 2) }.reduce(0, +))
