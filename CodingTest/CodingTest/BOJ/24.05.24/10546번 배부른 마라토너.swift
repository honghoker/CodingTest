//
//  백준 - 배부른 마라토너
//  https://www.acmicpc.net/problem/10546
//
//  Created by 홍은표 on 24/05/21.
//

import Foundation

print(Dictionary((0..<Int(readLine()!)! * 2 - 1).map { _ in (readLine()!, 1) }, uniquingKeysWith: +).first { $0.value % 2 != 0 }!.key)

