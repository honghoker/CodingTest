//  백준 - 영역 색칠
//  https://www.acmicpc.net/problem/28015
//  Created by 홍은표 on 2023/05/06.

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = [[Int]]()
var answer = 0
for _ in 0..<NM[0] { arr.append(readLine()!.split(separator: " ").map { Int(String($0))! }) }

for i in 0..<NM[0] {
    for j in 0..<NM[1] where arr[i][j] != 0 {
        let color = arr[i][j]
        var k = j
        while k < NM[1] && arr[i][k] != 0 {
            if arr[i][k] == color { arr[i][k] = 0 }
            k += 1
        }
        answer += 1
    }
}

print(answer)
