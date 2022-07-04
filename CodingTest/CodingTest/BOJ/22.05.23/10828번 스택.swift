//
//  10828번 스택
//  CodingTest
//
//  Created by 홍은표 on 2022/05/22.
//

import Foundation

let N = Int(readLine()!)!

var arr = [Int]()

func isEmpty() -> Bool {
    return arr.isEmpty
}

for _ in 0..<N {
    let command = readLine()!.split(separator: " ").map( { String($0) } )
    
    switch command.first! {
    case "push":
        arr.append(Int(command.last!)!)
    case "pop":
        if isEmpty() == true {
            print(-1)
        } else {
            print(arr.last!)
            arr.removeLast()
        }
    case "size":
        print(arr.count)
    case "empty":
        print(arr.isEmpty ? 1 : 0)
    case "top":
        if isEmpty() == true {
            print(-1)
        } else {
            print(arr.last!)
        }
    default:
        break
    }
}
