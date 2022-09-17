//
//  main.swift
//  CodingTest
//
//  Created by 홍은표 on 2022/09/17.
//

import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int]()

for i in 0..<N {
    dp.append(1)
    for j in 0...i {
        if A[j] < A[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)

//
//import Foundation
//
//var n = Int(readLine()!)!
//var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
//var lisList = [arr[0]]
//
//func lis(){
//    func binarySearch(target: Int) -> Int {
//        var start = 0
//        var end = lisList.count - 1
//        while start < end {
//            let mid = (start+end)/2
//            if lisList[mid] < target{
//                start = mid + 1
//            }else{
//                end = mid
//            }
//        }
//        return end
//    }
//    for i in 1 ..< n{
//        if arr[i] > lisList.last! { lisList += [arr[i]] }
//        else { lisList[binarySearch(target: arr[i])] = arr[i] }
//    }
//}
//lis()
//print(lisList.count)
