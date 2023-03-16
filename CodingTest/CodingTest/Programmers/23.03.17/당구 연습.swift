//  프로그래머스 - 당구 연습
//  https://school.programmers.co.kr/learn/courses/30/lessons/169198
//  Created by 홍은표 on 2023/03/17.

import Foundation

enum Direction: Int {
    case up = 0
    case down = 1
    case left = 2
    case right = 3
}

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    func calculateDistance(_ endX: Int, _ endY: Int, _ direction: Direction) -> Int {
        switch direction {
        case .up:
            if startX != endX || startY <= endY {
                return Int(pow(Double(startX - endX), 2) + pow(Double(startY + endY), 2))
            }
        case .right:
            if startX <= endX || startY != endY {
                return Int(pow(Double(startX + endX), 2) + pow(Double(startY - endY), 2))
            }
        case .down:
            if startX != endX || startY >= endY {
                return Int(pow(Double(startX - endX), 2) + pow(Double(startY - 2 * n + endY), 2))
            }
        case .left:
            if startX >= endX || startY != endY {
                return Int(pow(Double(startX - 2 * m + endX), 2) + pow(Double(startY - endY), 2))
            }
        }
        return Int.max
    }
    
    return balls.map { ball -> Int in
        (0...3).map { calculateDistance(ball[0], ball[1], Direction(rawValue: $0)!) }.min()!
    }
}
