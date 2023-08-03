//  백준 - 과제
//  https://www.acmicpc.net/problem/13904
//  Created by 홍은표 on 2023/08/03.

let N = Int(readLine()!)!
var arr = [(Int, Int)](), pq = [(Int, Int)]()
for _ in 0..<N {
    let I = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((I[0], I[1]))
}
arr.sort(by: { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 })
var answer = 0, day = arr.last!.0
while day > 0 {
    while let (d, _) = arr.last, d >= day {
        pq.append(arr.removeLast())
    }

    if !pq.isEmpty {
        pq.sort(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 })
        answer += pq.removeLast().1
    }
    
    day -= 1
}
print(answer)
