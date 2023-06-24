//  백준 - 수열과 시프트 쿼리
//  https://www.acmicpc.net/problem/17499
//  Created by 홍은표 on 2023/06/24.

let NQ = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var offset = 0
for _ in 0..<NQ[1] {
    let op = readLine()!.split(separator: " ").map { Int(String($0))! }
    if op[0] == 1 {
        let (i, x) = (op[1] - 1, op[2])
        arr[(i + offset) % arr.count] += x
    } else if op[0] == 2 {
        let s = op[1]
        offset = (offset - s + arr.count) % arr.count
    } else {
        let s = op[1]
        offset = (offset + s) % arr.count
    }
}
print(arr.indices.map { String(arr[($0 + offset) % arr.count]) }.joined(separator: " "))
