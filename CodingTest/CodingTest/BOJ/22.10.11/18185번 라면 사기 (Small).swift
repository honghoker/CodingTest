//  백준 - 라면 사기 (Small)
//  https://www.acmicpc.net/problem/18185
//  Created by 홍은표 on 2022/10/11.

// 1 2 1 1 = 12 O, 13 X  : 1 2 2 1 -> 0 1 1 1 -> 0 0 0 0
// 2 3 2 1 = 19 O, 20 X  : 2 3 2 1 -> 1 2 2 1 -> 0 1 1 1 -> 0 0 0 0

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! } + [0, 0]
var answer = 0

for i in 0..<N {
    if arr[i] == 0 { continue }
    
    if arr[i + 1] > arr[i + 2] {
        let twoVal = min(arr[i], arr[i + 1] - arr[i + 2]) // arr[i]와 arr[i+1] - arr[i+2]만큼의 차이 중 최소값으로 1 1 을 먼저 구매
        arr[i] -= twoVal; arr[i+1] -= twoVal
        answer += 5 * twoVal
        
        let threeVal = min(arr[i], min(arr[i + 1], arr[i + 2])) // arr[i], arr[i+1], arr[i+2] 중 최솟값으로 1 1 1 을 구매
        arr[i] -= threeVal; arr[i+1] -= threeVal; arr[i+2] -= threeVal
        answer += 7 * threeVal
    } else {
        let threeVal = min(arr[i], min(arr[i + 1], arr[i + 2])) // arr[i], arr[i+1], arr[i+2] 중 최솟값으로 1 1 1 을 구매
        arr[i] -= threeVal; arr[i+1] -= threeVal; arr[i+2] -= threeVal
        answer += 7 * threeVal
        
        let twoVal = min(arr[i], arr[i + 1]) // arr[i]와 arr[i+1] 중 최소값으로 1 1 을 먼저 구매
        arr[i] -= twoVal; arr[i+1] -= twoVal
        answer += 5 * twoVal
    }
    answer += 3 * arr[i]
}

print(answer)
